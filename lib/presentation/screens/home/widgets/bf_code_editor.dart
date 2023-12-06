import 'dart:math';

import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

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
  late final LinkedScrollControllerGroup _scrollControllers =
      LinkedScrollControllerGroup();
  late final _scrollControllerLinesNumbers = _scrollControllers.addAndGet();
  late final _scrollControllerCode = _scrollControllers.addAndGet();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<BfCubit>().state.editor.instructions;
  }

  @override
  void dispose() {
    _scrollControllerLinesNumbers.dispose();
    _scrollControllerCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final codeStyle = TextStyle(
        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        fontFamily: "SourceCodePro",
        height: 1.4,
        leadingDistribution: TextLeadingDistribution.proportional);
    final lineNumbersStyle = codeStyle.copyWith(color: Colors.grey);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 12),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<BfCubit, BfState>(
                    builder: (context, state) {
                      final linesCount =
                          RegExp(r'\n').allMatches(_controller.text).length + 1;
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: ((log(linesCount) / ln10).floor() + 1) *
                              (codeStyle.fontSize ?? 15) /
                              1.5,
                        ),
                        child: ListView.builder(
                          controller: _scrollControllerLinesNumbers,
                          itemCount: linesCount,
                          itemBuilder: (context, i) => Text(
                            (i + 1).toString(),
                            style: lineNumbersStyle,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: LayoutBuilder(builder: (context, contstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicWidth(
                stepWidth: contstraints.maxWidth,
                child: BfInstructionsListener(
                  controller: _controller,
                  child: TextField(
                    scrollController: _scrollControllerCode,
                    controller: _controller,
                    onChanged: context.read<BfCubit>().setInstructions,
                    style: codeStyle,
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
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 4),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class BfInstructionsListener extends BlocListener<BfCubit, BfState> {
  final BfTextController controller;
  final Function(int)? onInstructionsChange;
  BfInstructionsListener(
      {super.key,
      super.child,
      required this.controller,
      this.onInstructionsChange})
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
        }, listener: (_, state) {
          controller.value = controller.value.copyWith(
            text: state.editor.instructions,
          );
          controller.selectedCharIndex = state.mapOrNull(
            running: (s) => s.program.iPointer,
            paused: (s) => s.program.iPointer,
          );
        });
}
