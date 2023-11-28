import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfOutputField extends StatelessWidget {
  const BfOutputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<BfCubit, BfState>(
            builder: (context, state) => Text(state.editor.output),
          ),
        ),
        const BfClearOutputActionButton(),
      ],
    );
  }
}
