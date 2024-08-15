import 'package:flutter/material.dart';
import 'package:untitled_app/models/user.dart';
import 'package:untitled_app/styles/button_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.currentUser});

  final LocalUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 12, right: 12),
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Image(
                            image: NetworkImage(
                                "https://www.w3schools.com/w3images/avatar2.png")),
                      ),
                      Text(currentUser.email),
                    ],
                  ),
                  useGreyDivider(),
                  Column(
                    children: [
                      TextButton(
                        child: const Text("Sign Up"),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/sign-up');
                        },
                      ),
                      TextButton(
                        child: const Text("Log In"),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/log-in');
                        },
                      ),
                      const TextButton(
                        onPressed: null,
                        child: Text("Page # 3"),
                      ),
                      const TextButton(
                        onPressed: null,
                        child: Text("Page # 4"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
