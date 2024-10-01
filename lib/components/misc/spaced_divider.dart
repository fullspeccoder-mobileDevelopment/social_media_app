import 'package:flutter/material.dart';

class SpacedDivider extends StatelessWidget {
  const SpacedDivider({
    super.key,
    this.whitespace,
    this.color,
    this.thickness,
  });

  final double? whitespace;
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: whitespace),
        Divider(
          thickness: thickness,
          color: color,
        ),
        SizedBox(height: whitespace),
      ],
    );
  }
}
