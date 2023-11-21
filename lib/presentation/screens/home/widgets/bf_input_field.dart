import 'package:flutter/material.dart';

class BfInputField extends StatelessWidget {
  const BfInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "input",
        isDense: true,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
