import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class LineOr extends StatelessWidget {
  const LineOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: useGreyDivider(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'or',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: useGreyDivider(),
        ),
      ],
    );
  }
}
