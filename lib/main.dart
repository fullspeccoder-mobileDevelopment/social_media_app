import 'package:flutter/material.dart';
import 'package:untitled_app/pages/home_page.dart';
import 'package:untitled_app/pages/sign_up.dart';

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
        '/': (context) => const HomePage(),
        '/sign-up': (context) => const SignUp(),
      },
    );
  }
}
