import 'package:flutter/material.dart';

class EditableAvatar extends StatelessWidget {
  const EditableAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 125,
      child: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/avatar.png'))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 48.0, right: 32.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
