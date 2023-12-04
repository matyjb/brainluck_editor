import 'package:flutter/material.dart';

class BfDataCell extends StatelessWidget {
  final int value;
  final int address;
  final bool highlighted;
  const BfDataCell({
    super.key,
    required this.value,
    required this.address,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: highlighted
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).highlightColor,
          width: 3,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "#$address",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.grey),
            ),
            Center(
              child: Text(value.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
