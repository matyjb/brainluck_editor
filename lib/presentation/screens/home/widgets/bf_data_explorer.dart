import 'package:brainluck_editor/presentation/widgets/c_card.dart';
import 'package:flutter/material.dart';

class BfDataExplorer extends StatelessWidget {
  const BfDataExplorer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CCard(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 50),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (_, i) => Text(i.toString()),
        ),
      ),
    );
  }
}
