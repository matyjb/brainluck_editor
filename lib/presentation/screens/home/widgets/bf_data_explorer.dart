import 'package:brainluck_editor/constants.dart';
import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_data_cell.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BfDataExplorer extends StatefulWidget {
  const BfDataExplorer({super.key});

  @override
  State<BfDataExplorer> createState() => _BfDataExplorerState();
}

class _BfDataExplorerState extends State<BfDataExplorer> {
  final _itemScrollController = ItemScrollController();

  void _scrollToCurrent() {
    _itemScrollController.scrollTo(
      index: context.read<BfCubit>().state.dpointer,
      duration: const Duration(milliseconds: 200),
      alignment: 0.5,
    );
  }

  @override
  void initState() {
    super.initState();
    if (context.read<BfCubit>().state.dpointer != 0) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollToCurrent();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BfCubit, BfState>(
      listener: (context, state) => _scrollToCurrent(),
      listenWhen: (prev, curr) => prev.dpointer != curr.dpointer,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 60),
        child: Column(
          children: [
            const BfClearDataActionButton(),
            BfActionButton(
              onPressed: _scrollToCurrent,
              tooltip: "scroll to pointer",
              icon: Icons.screen_rotation_alt_outlined,
            ),
            Expanded(
              child: ScrollablePositionedList.separated(
                itemScrollController: _itemScrollController,
                padding: const EdgeInsets.all(8),
                itemCount: stripSize,
                itemBuilder: (_, i) => BlocBuilder<BfCubit, BfState>(
                  builder: (context, state) => BfDataCell(
                    value: state.data[i],
                    highlighted: state.dpointer == i,
                  ),
                  buildWhen: (prev, curr) =>
                      // cell value changed
                      prev.data[i] != curr.data[i] ||
                      // or pointer started/stopped pointing to i'th cell
                      ((prev.dpointer == i) ^ (curr.dpointer == i)),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
