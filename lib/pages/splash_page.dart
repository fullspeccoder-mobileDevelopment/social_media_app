import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/user.dart';
import 'package:untitled_app/utils/nav_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  LocalUser? currentUser;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      pushReplacementToHomePage(context);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 125.0,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: const Text("Welcome!",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 50,
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Efficiently post your content across various social media",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Keeping here if changes are needed
// } else {
//   Future.delayed(const Duration(seconds: 2), () {
//     Navigator.of(context).popAndPushNamed("/sign-up");
//   });
// }