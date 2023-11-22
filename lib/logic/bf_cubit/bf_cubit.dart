import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:brainluck_editor/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bf_state.dart';
part 'bf_cubit.freezed.dart';

final _bfCharsRegExp = RegExp(r'[<>.,\[\]+-]');

class BfCubit extends Cubit<BfState> {
  BfCubit() : super(BfState(data: List.generate(stripSize, (_) => 0)));

  String get currentInstruction => state.instructions[state.ipointer];
  int get currentCellValue => state.data[state.dpointer];

  // # INSTRUCTIONS
  int _findIndexOfNext([int start = 0]) {
    // advances pointer till it finds a valid character
    int i = state.instructions.indexOf(
      _bfCharsRegExp,
      start,
    );

    return i;
  }

  resetInsPointer() {
    emit(state.copyWith(
      ipointer: _findIndexOfNext(),
    ));
  }

  setInstructions(String instructions) {
    emit(state.copyWith(
      instructions: instructions,
      ipointer: -1,
    ));
  }
  // ##

  // # DATA
  resetData() {
    emit(state.copyWith(
      data: List.generate(stripSize, (_) => 0),
    ));
  }

  _moveDataPointerLeft(int currentInsPointer) {
    emit(state.copyWith(
      dpointer: max(state.dpointer - 1, 0),
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  _moveDataPointerRight(int currentInsPointer) {
    emit(state.copyWith(
      dpointer: min(state.dpointer + 1, state.data.length),
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  _incData(int currentInsPointer) {
    final List<int> data = List.from(state.data);
    data[state.dpointer] = (data[state.dpointer] + 1) % 256;
    emit(state.copyWith(
      data: data,
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  _decData(int currentInsPointer) {
    final List<int> data = List.from(state.data);
    data[state.dpointer] = (data[state.dpointer] - 1) % 256;
    emit(state.copyWith(
      data: data,
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  // # INPUT OUTPUT
  setInput(String input) {
    emit(state.copyWith(input: input, inputPointer: 0));
  }

  _readInput(int currentInsPointer) {
    final List<int> data = List.from(state.data);
    data[state.dpointer] = state.input[state.inputPointer].codeUnitAt(0);
    emit(state.copyWith(
      data: data,
      inputPointer: state.inputPointer + 1,
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  clearOutput() {
    emit(state.copyWith(output: ""));
  }

  _writeToOutput(int currentInsPointer) {
    emit(state.copyWith(
      output: state.output + String.fromCharCode(state.data[state.dpointer]),
      ipointer: _findIndexOfNext(currentInsPointer + 1),
    ));
  }

  // ###########
  // TODO: execute() to rethink
  execute() async {
    emit(state.copyWith(locked: true));
    executeOne();
    while (state.ipointer < state.instructions.length && state.ipointer >= 0) {
      await Future.delayed(const Duration(milliseconds: 100), executeOne);
    }
    emit(state.copyWith(locked: false));
  }

  executeOne() {
    // if halted move ipointer to first instruction
    int ipointer = state.ipointer;
    if (state.ipointer == -1) ipointer = _findIndexOfNext();

    switch (state.instructions[ipointer]) {
      case "<":
        _moveDataPointerLeft(ipointer);
        break;
      case ">":
        _moveDataPointerRight(ipointer);
        break;
      case "+":
        _incData(ipointer);
        break;
      case "-":
        _decData(ipointer);
        break;
      case ".":
        _readInput(ipointer);
        break;
      case ",":
        _writeToOutput(ipointer);
        break;
      case "[":
        if (currentCellValue == 0) {
          int parenthesisCounter = 0;
          int i = ipointer + 1;
          while (parenthesisCounter != 0 || state.instructions[i] != "]") {
            if (state.instructions[i] == "[") parenthesisCounter++;
            if (state.instructions[i] == "]") parenthesisCounter--;
            i++;
          }
          emit(state.copyWith(ipointer: _findIndexOfNext(i + 1)));
        } else {
          emit(state.copyWith(ipointer: _findIndexOfNext(ipointer + 1)));
        }
        break;
      case "]":
        if (currentCellValue != 0) {
          int parenthesisCounter = 0;
          int i = ipointer - 1;
          while (parenthesisCounter != 0 || state.instructions[i] != "[") {
            if (state.instructions[i] == "[") parenthesisCounter++;
            if (state.instructions[i] == "]") parenthesisCounter--;
            i--;
          }
          emit(state.copyWith(ipointer: _findIndexOfNext(i + 1)));
        } else {
          emit(state.copyWith(ipointer: _findIndexOfNext(ipointer + 1)));
        }
        break;
      // default:
      //   advanceInsPointer();
      //   executeOne();
    }
  }
}
