import 'package:flutter/material.dart';
import 'package:untitled_app/pages/home_page.dart';
import 'package:untitled_app/pages/login_page.dart';
import 'package:untitled_app/pages/sign_up.dart';
import 'package:untitled_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/sign-up': (context) => const SignUp(),
        '/log-in': (context) => LogIn(),
      },
    );
  }
}
