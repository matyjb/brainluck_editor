import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfActionButton extends StatelessWidget {
  final Function()? onPressed;
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

class BfStartActionButton extends StatelessWidget {
  const BfStartActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().start,
      tooltip: "Start",
      icon: Icons.play_arrow_rounded,
    );
  }
}

class BfContinueOrPauseActionButton extends StatelessWidget {
  const BfContinueOrPauseActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BfCubit, BfState>(
      builder: (context, state) => state.maybeMap(
        running: (state) => BfActionButton(
          onPressed: context.read<BfCubit>().continueOrPause,
          tooltip: "Pause",
          icon: Icons.pause_rounded,
        ),
        orElse: () => BfActionButton(
          onPressed: context.read<BfCubit>().continueOrPause,
          tooltip: "Continue",
          icon: Icons.play_arrow_outlined,
        ),
      ),
    );
  }
}

class BfStopActionButton extends StatelessWidget {
  const BfStopActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().stop,
      tooltip: "Stop",
      icon: Icons.stop_rounded,
    );
  }
}

class BfRestartActionButton extends StatelessWidget {
  const BfRestartActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().restart,
      tooltip: "Restart",
      icon: Icons.restart_alt_rounded,
    );
  }
}

class BfStepOneActionButton extends StatelessWidget {
  const BfStepOneActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BfActionButton(
      onPressed: context.read<BfCubit>().stepOne,
      tooltip: "Step one instruction",
      icon: Icons.skip_next_rounded,
    );
  }
}
