import 'package:flutter/material.dart';
import 'package:untitled_app/components/misc/grey_divider.dart';

class LineOr extends StatelessWidget {
  const LineOr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: GreyDivider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'or',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: GreyDivider(),
        ),
      ],
    );
  }
}
