import 'package:bloc_test/bloc_test.dart';
import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  startsWith(List<int> d0, List<int> d1) {
    for (var i = 0; i < d1.length; i++) {
      if (d0[i] != d1[i]) return false;
    }
    return true;
  }

  Matcher matchesState(List<int> data, int dpointer, int ipointer) => allOf([
        isA<BfState>(),
        predicate<BfState>((p0) => startsWith(p0.data, data)),
        predicate<BfState>((p0) => p0.ipointer == ipointer),
        predicate<BfState>((p0) => p0.dpointer == dpointer),
      ]);

  blocTest<BfCubit, BfState>(
    'Addition of 1+2',
    build: () => BfCubit(),
    act: (bloc) async {
      bloc.setInstructions("+>++[<+>-]");
      await bloc.execute();
    },
    expect: () => [
      predicate<BfState>((p0) => p0.instructions == "+>++[<+>-]"),
      predicate<BfState>((p0) => p0.locked),
      // +
      matchesState([1, 0], 0, 1),
      // >
      matchesState([1, 0], 1, 2),
      // ++
      matchesState([1, 1], 1, 3),
      matchesState([1, 2], 1, 4),
      // [
      matchesState([1, 2], 1, 5),

      // < // FIRST LOOP RUN
      matchesState([1, 2], 0, 6),
      // +
      matchesState([2, 2], 0, 7),
      // >
      matchesState([2, 2], 1, 8),
      // -
      matchesState([2, 1], 1, 9),
      // ]
      matchesState([2, 1], 1, 5),

      // < // SECOND LOOP RUN
      matchesState([2, 1], 0, 6),
      // +
      matchesState([3, 1], 0, 7),
      // >
      matchesState([3, 1], 1, 8),
      // -
      matchesState([3, 0], 1, 9),
      // ]
      matchesState([3, 0], 1, -1),
      predicate<BfState>((p0) => !p0.locked),
    ],
  );
}
