import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfInputField extends StatefulWidget {
  const BfInputField({super.key});

  @override
  State<BfInputField> createState() => _BfInputFieldState();
}

class _BfInputFieldState extends State<BfInputField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<BfCubit>().state.editor.input;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BfCubit, BfState>(
      listener: (context, state) {
        _controller.value =
            _controller.value.copyWith(text: state.editor.input);
      },
      child: TextField(
        controller: _controller,
        onChanged: context.read<BfCubit>().setInput,
        decoration: const InputDecoration(
          hintText: "input",
          isDense: true,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
