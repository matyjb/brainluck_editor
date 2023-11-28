import 'package:bloc_test/bloc_test.dart';
import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  startsWith(List<int> d0, Map<int, int> d1) {
    for (var i = 0; i < d1.length; i++) {
      if (d0[i] != (d1[i] ?? 0)) return false;
    }
    return true;
  }

  Matcher matchesStateRunning(List<int> data, int dpointer, int ipointer) => allOf([
        isA<BfStateRunning>(),
        predicate<BfStateRunning>((p0) => startsWith(data, p0.editor.data)),
        predicate<BfStateRunning>((p0) => p0.program.iPointer == ipointer),
        predicate<BfStateRunning>((p0) => p0.program.dPointer == dpointer),
      ]);

  blocTest<BfCubit, BfState>(
    'Addition of 1+2',
    build: () => BfCubit(),
    wait: const Duration(milliseconds: waitTimeMs*20),
    act: (bloc) async {
      bloc.setInstructions("+>++[<+>-]");
      await bloc.start();
    },
    expect: () => [
      predicate<BfStateStopped>((p0) => p0.editor.instructions == "+>++[<+>-]"),
      isA<BfStateRunning>(),
      // +
      matchesStateRunning([1, 0], 0, 1),
      // >
      matchesStateRunning([1, 0], 1, 2),
      // ++
      matchesStateRunning([1, 1], 1, 3),
      matchesStateRunning([1, 2], 1, 4),
      // [
      matchesStateRunning([1, 2], 1, 5),

      // < // FIRST LOOP RUN
      matchesStateRunning([1, 2], 0, 6),
      // +
      matchesStateRunning([2, 2], 0, 7),
      // >
      matchesStateRunning([2, 2], 1, 8),
      // -
      matchesStateRunning([2, 1], 1, 9),
      // ]
      matchesStateRunning([2, 1], 1, 5),

      // < // SECOND LOOP RUN
      matchesStateRunning([2, 1], 0, 6),
      // +
      matchesStateRunning([3, 1], 0, 7),
      // >
      matchesStateRunning([3, 1], 1, 8),
      // -
      matchesStateRunning([3, 0], 1, 9),
      // ]
      matchesStateRunning([3, 0], 1, 10),
      isA<BfStateStopped>(),
    ],
  );
}
