import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfActionButton extends StatelessWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  const BfActionButton({
    super.key,
    required this.onPressed,
    required this.tooltip,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}

class BfClearOutputActionButton extends StatelessWidget {
  const BfClearOutputActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().clearOutput,
      tooltip: "Clear output",
      icon: Icons.clear_rounded,
    );
  }
}

class BfClearDataActionButton extends StatelessWidget {
  const BfClearDataActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().resetData,
      tooltip: "Reset cells",
      icon: Icons.delete_outline_outlined,
    );
  }
}

class BfExecuteOneActionButton extends StatelessWidget {
  const BfExecuteOneActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().executeOne,
      tooltip: "Run one instruction",
      icon: Icons.skip_next_rounded,
    );
  }
}

class BfExecuteActionButton extends StatelessWidget {
  const BfExecuteActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().execute,
      tooltip: "Run",
      icon: Icons.play_arrow_rounded,
    );
  }
}

class BfResetInsPointerActionButton extends StatelessWidget {
  const BfResetInsPointerActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().resetInsPointer,
      tooltip: "Reset instruction pointer",
      icon: Icons.restore_rounded,
    );
  }
}

