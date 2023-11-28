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
  void initState() {
    super.initState();
    _controller.text = context.read<BfCubit>().state.editor.instructions;
  }

  @override
  Widget build(BuildContext context) {
    return BfInstructionsListener(
      listener: (_, state) {
        _controller.value = _controller.value.copyWith(
          text: state.editor.instructions,
        );
        _controller.selectedCharIndex = state.mapOrNull(
          running: (s) => s.program.iPointer,
          paused: (s) => s.program.iPointer,
        );
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
      : super(listenWhen: (prev, curr) {
          if (prev.editor.instructions != curr.editor.instructions) return true;

          final iPointerPrev = prev.mapOrNull(
            running: (s) => s.program.iPointer,
            paused: (s) => s.program.iPointer,
          );
          final iPointerCurr = curr.mapOrNull(
            running: (s) => s.program.iPointer,
            paused: (s) => s.program.iPointer,
          );

          return iPointerPrev != iPointerCurr;
        });
}
