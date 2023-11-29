import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:brainluck_editor/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bf_state.dart';
part 'bf_cubit.freezed.dart';

const waitTimeMs = 0;
const maxStepsPerTick = 200;
// TODO: if instructions are empty, it will throw exception

class BfCubit extends Cubit<BfState> {
  Timer? _ticker;
  double stepsError = 0;
  BfCubit() : super(BfState.init());

  _setTicker() {
    _ticker?.cancel();
    stepsError = 0;
    _ticker = Timer.periodic(
        Duration(milliseconds: max(waitTimeMs, maxStepsPerTick)), (timer) {
      if (state is BfStateRunning) {
        int stepsToDo = maxStepsPerTick;
        if (waitTimeMs != 0) {
          final s = maxStepsPerTick + stepsError;
          stepsToDo = s ~/ waitTimeMs;
          stepsError = s - s.floor();
        }

        BfState stateToEmit = state;
        do {
          final s = stateToEmit as BfStateRunning;
          if (_checkIfEnded(s)) {
            stateToEmit = BfState.stopped(editor: s.editor);
            break;
          } else {
            final next = _performInstruction(s.editor, s.program);
            stateToEmit =
                BfState.running(editor: next.editor, program: next.program);
          }
          stepsToDo--;
        } while (stepsToDo >= 1);
        emit(stateToEmit);
      }
    });
  }

  bool _checkIfEnded([BfState? state]) {
    return (state ?? this.state).map(
      running: (s) => s.program.iPointer >= s.editor.instructions.length,
      paused: (s) => s.program.iPointer >= s.editor.instructions.length,
      stopped: (_) => false,
    );
  }

  @override
  close() async {
    _ticker?.cancel();
    await super.close();
  }

  _onRun(BfState nextState) {
    _setTicker();
    emit(nextState);
  }

  _onPauseOrStop(BfState nextState) {
    emit(nextState);
    _ticker?.cancel();
  }

  // User actions
  start() {
    state.when(
      running: (editor, program) {
        // cant start already started program
      },
      paused: (editor, program) {
        // cant start paused
      },
      stopped: (editor) {
        // run program
        _onRun(BfState.running(
          editor: editor.copyWith(data: {}),
          program: const BfProgramState(),
        ));
      },
    );
  }

  continueOrPause() {
    state.when(
      running: (editor, program) {
        // pause the program
        _onPauseOrStop(BfState.paused(editor: editor, program: program));
      },
      paused: (editor, program) {
        // continue with program
        _onRun(BfState.running(
          editor: editor,
          program: program,
        ));
      },
      stopped: (editor) {
        // cant pause or continue not started program
      },
    );
  }

  stop() {
    state.when(
      running: (editor, program) {
        // stop the program
        _onPauseOrStop(BfState.stopped(editor: editor));
      },
      paused: (editor, program) {
        // stop the program
        _onPauseOrStop(BfState.stopped(editor: editor));
      },
      stopped: (editor) {
        // program is already stopped
      },
    );
  }

  restart() {
    state.when(
      running: (editor, program) {
        _onRun(BfState.running(
          editor: editor.copyWith(data: {}, output: ""),
          program: const BfProgramState(),
        ));
      },
      paused: (editor, program) {
        _onRun(BfState.running(
          editor: editor.copyWith(data: {}, output: ""),
          program: const BfProgramState(),
        ));
      },
      stopped: (editor) {
        // cant restart not started program
      },
    );
  }

  stepOne() {
    // execute one instruction if paused or stopped
    state.when(
      running: (editor, program) {
        // cant do this here
      },
      paused: (editor, program) {
        if (_checkIfEnded()) {
          emit(BfState.stopped(editor: editor));
        } else {
          final next = _performInstruction(editor, program);
          emit(BfState.paused(editor: next.editor, program: next.program));
        }
      },
      stopped: (editor) {
        if (_checkIfEnded()) {
          emit(BfState.stopped(editor: editor));
        } else {
          final next = _performInstruction(
              editor.copyWith(data: {}), const BfProgramState());
          emit(BfState.paused(editor: next.editor, program: next.program));
        }
      },
    );
  }

  // # editor manipulation
  setInstructions(String instructions) {
    emit(state.copyWith(
      editor: state.editor.copyWith(
        instructions: instructions,
      ),
    ));
  }

  setInput(String input) {
    emit(state.copyWith(
      editor: state.editor.copyWith(
        input: input,
      ),
    ));
  }

  clearOutput() {
    emit(state.copyWith(
      editor: state.editor.copyWith(
        output: "",
      ),
    ));
  }
  // ####

  ({BfEditorState editor, BfProgramState program}) _performInstruction(
    BfEditorState editor,
    BfProgramState program,
  ) {
    int ipointer = program.iPointer;
    switch (editor.instructions[ipointer]) {
      case "<":
        return (
          editor: editor,
          program: program.copyWith(
            dPointer: max(0, program.dPointer - 1),
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
      case ">":
        return (
          editor: editor,
          program: program.copyWith(
            dPointer: min(stripSize, program.dPointer + 1),
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
      case "+":
        return (
          editor: editor.copyWith(
            data: Map.from(editor.data)
              ..update(
                program.dPointer,
                (v) => (v + 1) % 256,
                ifAbsent: () => 1,
              ),
          ),
          program: program.copyWith(
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
      case "-":
        return (
          editor: editor.copyWith(
            data: Map.from(editor.data)
              ..update(
                program.dPointer,
                (v) => (v - 1) % 256,
                ifAbsent: () => 255,
              ),
          ),
          program: program.copyWith(
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
      case ",":
        final value = editor.input[program.inputPointer].codeUnits.first;
        return (
          editor: editor.copyWith(
            data: Map.from(editor.data)
              ..update(
                program.dPointer,
                (v) => value,
                ifAbsent: () => value,
              ),
          ),
          program: program.copyWith(
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
            inputPointer: program.inputPointer + 1,
          ),
        );
      case ".":
        final value = String.fromCharCode(editor.data[program.dPointer] ?? 0);
        return (
          editor: editor.copyWith(
            output: editor.output + value,
          ),
          program: program.copyWith(
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
      case "[":
        final cellValue = editor.data[program.dPointer] ?? 0;
        int nextiPointer = ipointer;
        if (cellValue == 0) {
          int parenthesisCounter = 0;
          int i = ipointer + 1;
          while (parenthesisCounter != 0 || editor.instructions[i] != "]") {
            if (editor.instructions[i] == "[") parenthesisCounter++;
            if (editor.instructions[i] == "]") parenthesisCounter--;
            i++;
          }
          nextiPointer = editor.indexOfNextInstruction(i + 1);
        } else {
          nextiPointer = editor.indexOfNextInstruction(ipointer + 1);
        }
        return (
          editor: editor,
          program: program.copyWith(iPointer: nextiPointer),
        );
      case "]":
        final cellValue = editor.data[program.dPointer] ?? 0;
        int nextiPointer = ipointer;
        if (cellValue != 0) {
          int parenthesisCounter = 0;
          int i = ipointer - 1;
          while (parenthesisCounter != 0 || editor.instructions[i] != "[") {
            if (editor.instructions[i] == "[") parenthesisCounter++;
            if (editor.instructions[i] == "]") parenthesisCounter--;
            i--;
          }
          nextiPointer = editor.indexOfNextInstruction(i + 1);
        } else {
          nextiPointer = editor.indexOfNextInstruction(ipointer + 1);
        }
        return (
          editor: editor,
          program: program.copyWith(iPointer: nextiPointer),
        );
      default:
        return (
          editor: editor,
          program: program.copyWith(
            iPointer: editor.indexOfNextInstruction(ipointer + 1),
          ),
        );
    }
  }
}
