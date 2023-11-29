import 'package:flutter/material.dart';

/// based on rich_text_controller package

/// a custom controller based on [TextEditingController] used to activly style input text based on regex patterns and word matching
/// with some custom features.
/// {@tool snippet}
///
/// ```dart
/// class _ExampleState extends State<Example> {
///
///   late RichTextController _controller;
///
/// _controller = RichTextController(
///       deleteOnBack: true,
///       patternMatchMap: {
///         //Returns every Hashtag with red color
///         RegExp(r"\B#[a-zA-Z0-9]+\b"):
///             const TextStyle(color: Colors.red, fontSize: 22.0),
///         //Returns every Mention with blue color and bold style.
///         RegExp(r"\B@[a-zA-Z0-9]+\b"): const TextStyle(
///           fontWeight: FontWeight.w800,
///           color: Colors.blue,
///         ),
///       },
///       regExpCaseSensitive: false,
/// );
///
///  TextFormField(
///  controller: _controller,
///  ...
/// )
///
/// ```
/// {@end-tool}
class BfTextController extends TextEditingController {
  final Map<RegExp, TextStyle>? patternMatchMap;
  int? _selectedCharIndex;
  final Function(List<String> match) onMatch;
  final Function(List<Map<String, List<int>>>)? onMatchIndex;
  final bool? deleteOnBack;
  String _lastValue = "";

  /// controls the caseSensitive property of the full [RegExp] used to pattern match
  final bool regExpCaseSensitive;

  /// controls the dotAll property of the full [RegExp] used to pattern match
  final bool regExpDotAll;

  /// controls the multiLine property of the full [RegExp] used to pattern match
  final bool regExpMultiLine;

  /// controls the unicode property of the full [RegExp] used to pattern match
  final bool regExpUnicode;

  bool isBack(String current, String last) {
    return current.length < last.length;
  }

  BfTextController(
      {String? text,
      this.patternMatchMap,
      required this.onMatch,
      this.onMatchIndex,
      this.deleteOnBack = false,
      this.regExpCaseSensitive = true,
      this.regExpDotAll = false,
      this.regExpMultiLine = false,
      this.regExpUnicode = false})
      : super(text: text);

  /// Setting this will notify all the listeners of this [TextEditingController]
  /// that they need to update (it calls [notifyListeners]).
  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  set selectedCharIndex(int? index) {
    _selectedCharIndex = index;
    notifyListeners();
  }

  int? get selectedCharIndex => _selectedCharIndex;

  /// Builds [TextSpan] from current editing value.
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    List<TextSpan> children = [];
    final matches = <String>{};
    List<Map<String, List<int>>> matchIndex = [];

    // Validating with REGEX
    RegExp? allRegex;
    allRegex = patternMatchMap != null
        ? RegExp(patternMatchMap?.keys.map((e) => e.pattern).join('|') ?? "",
            caseSensitive: regExpCaseSensitive,
            dotAll: regExpDotAll,
            multiLine: regExpMultiLine,
            unicode: regExpUnicode)
        : null;
    ////
    ///
    text.splitMapJoin(
      allRegex!,
      onNonMatch: (String span) {
        children.add(TextSpan(text: span, style: style));
        return span.toString();
      },
      onMatch: (Match m) {
        matches.add(m[0]!);
        final RegExp? k = patternMatchMap?.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;

        if (deleteOnBack!) {
          if ((isBack(text, _lastValue) && m.end == selection.baseOffset)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              children.removeWhere((element) => element.text! == text);
              text = text.replaceRange(m.start, m.end, "");
              selection = selection.copyWith(
                baseOffset: m.end - (m.end - m.start),
                extentOffset: m.end - (m.end - m.start),
              );
            });
          } else {
            children.add(
              TextSpan(
                text: m[0],
                style: patternMatchMap![k],
              ),
            );
          }
        } else {
          children.add(
            TextSpan(
              text: m[0],
              style: patternMatchMap![k],
            ),
          );
        }
        final resultMatchIndex = matchValueIndex(m);
        if (resultMatchIndex != null && onMatchIndex != null) {
          matchIndex.add(resultMatchIndex);
          onMatchIndex!(matchIndex);
        }

        return (onMatch(List<String>.unmodifiable(matches)) ?? '');
      },
    );
    if (_selectedCharIndex != null) {
      int s = 0;
      for (int idx = 0; idx < children.length; idx++) {
        final child = children[idx];
        final highlightedCharIdx = _selectedCharIndex! - s;
        s += child.text?.length ?? 0;
        if (s > _selectedCharIndex!) {
          // selected char is inside child, split into three spans
          children.replaceRange(idx, idx + 1, [
            TextSpan(
              text: child.text?.substring(0, highlightedCharIdx) ?? '',
              style: child.style,
            ),
            TextSpan(
              text: child.text?[highlightedCharIdx] ?? '',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            TextSpan(
              text: child.text?.substring(highlightedCharIdx + 1) ?? '',
              style: child.style,
            ),
          ]);
          break;
        }
      }
    }

    _lastValue = text;
    return TextSpan(style: style, children: children);
  }

  Map<String, List<int>>? matchValueIndex(Match match) {
    final matchValue = match[0]?.replaceFirstMapped('#', (match) => '');
    if (matchValue != null) {
      final firstMatchChar = match.start + 1;
      final lastMatchChar = match.end - 1;
      final compactMatch = {
        matchValue: [firstMatchChar, lastMatchChar]
      };
      return compactMatch;
    }
    return null;
  }
}
