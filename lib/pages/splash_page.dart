import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  void _navigateAfterLoading() {
    Future.delayed(const Duration(seconds: 2), () {
      final currentUser = ref.read(userProvider);
      print(currentUser.id);
      if (currentUser.id.isEmpty) {
        Navigator.popAndPushNamed(context, Routes.signUpString);
        return;
      }
      Navigator.popAndPushNamed(context, Routes.homeString);
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateAfterLoading();
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
