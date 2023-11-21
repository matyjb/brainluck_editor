import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfOutputField extends StatelessWidget {
  const BfOutputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text("output")),
        IconButton(
          onPressed: context.read<BfCubit>().clearOutput,
          icon: const Icon(Icons.clear_rounded),
        ),
      ],
    );
  }
}
