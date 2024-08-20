import 'package:flutter/material.dart';

// Creates a GreyDivider with the text 'or' in the middle and another GreyDivider on the end.
class LineOr extends StatelessWidget {
  const LineOr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'or',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
