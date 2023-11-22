part of 'bf_cubit.dart';

@freezed
class BfState with _$BfState {
  const factory BfState({
    @Default(false) locked,
    // -1 means the program halted
    @Default(-1) int ipointer,
    @Default("") String instructions,
    @Default(0) int dpointer,
    required List<int> data,
    @Default(0) int inputPointer,
    @Default("") String input,
    @Default("") String output,
  }) = _BfState;
}
