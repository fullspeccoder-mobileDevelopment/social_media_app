import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text("Drawer will be here"),
            ),
          ),
        ],
      ),
    );
  }
}
