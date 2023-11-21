import 'package:flutter/material.dart';

class CCard extends Card {
  CCard({super.key, Widget? child})
      : super(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: child,
          ),
        );
}
