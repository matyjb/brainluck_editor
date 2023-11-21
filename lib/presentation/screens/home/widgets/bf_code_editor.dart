import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BfCodeEditor extends StatefulWidget {
  const BfCodeEditor({super.key});

  @override
  State<BfCodeEditor> createState() => _BfCodeEditorState();
}

class _BfCodeEditorState extends State<BfCodeEditor> {
  final _controller = BfTextController(
    onMatch: (_) {},
    patternMatchMap: {
      RegExp(r'[^\[\]+\-\.,><]+'): const TextStyle(color: Colors.grey),
    },
  );

  @override
  Widget build(BuildContext context) {
    return BfInstructionsListener(
      listener: (_, state) {
        _controller.text = state.instructions;
        _controller.selectedCharIndex =
            state.ipointer == state.instructions.length ? null : state.ipointer;
      },
      child: TextField(
        controller: _controller,
        onChanged: context.read<BfCubit>().setInstructions,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
          fontFamily: "SourceCodePro",
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        autocorrect: false,
        enableSuggestions: false,
        decoration: const InputDecoration(
          hintText: "code",
          isCollapsed: true,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class BfInstructionsListener extends BlocListener<BfCubit, BfState> {
  BfInstructionsListener({super.key, super.child, required super.listener})
      : super(
          listenWhen: (prev, curr) =>
              prev.instructions != curr.instructions ||
              prev.ipointer != curr.ipointer,
        );
}
