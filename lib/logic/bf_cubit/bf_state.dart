part of 'bf_cubit.dart';

final _bfCharsRegExp = RegExp(r'[<>.,\[\]+-]');

@freezed
class BfEditorState with _$BfEditorState {
  const BfEditorState._();

  const factory BfEditorState({
    @Default(bfHelloWorld) String instructions,
    required Map<int, int> data,
    @Default("") String input,
    @Default("") String output,
  }) = _BfEditorState;

  int indexOfNextInstruction([int start = 0]) {
    final idx = instructions.indexOf(
      _bfCharsRegExp,
      start,
    );
    // if not found then the next instruction is the end of the program
    return idx == -1 ? instructions.length : idx;
  }
}

@freezed
class BfProgramState with _$BfProgramState {
  const factory BfProgramState({
    @Default(0) int iPointer,
    @Default(0) int dPointer,
    @Default(0) int inputPointer,
  }) = _BfProgramState;
}

@freezed
class BfState with _$BfState {
  const factory BfState.running({
    required BfEditorState editor,
    required BfProgramState program,
  }) = BfStateRunning;

  const factory BfState.paused({
    required BfEditorState editor,
    required BfProgramState program,
  }) = BfStatePaused;

  const factory BfState.stopped({
    required BfEditorState editor,
  }) = BfStateStopped;

  factory BfState.init() => const BfState.stopped(
        editor: BfEditorState(data: {}),
      );
}
