import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/pages/create_post.dart';
import 'package:untitled_app/pages/home_page.dart';
import 'package:untitled_app/pages/link_first_page.dart';
import 'package:untitled_app/pages/login_page.dart';
import 'package:untitled_app/pages/sign_up.dart';
import 'package:untitled_app/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentUser = ref.watch(userProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
        '/sign-up': (context) => const SignUp(),
        '/log-in': (context) => const LogIn(),
        '/link-first-page': (context) => const LinkPage(),
        '/create-post': (context) => const CreatePostPage(),
      },
    );
  }
}
