import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/pages/create_post.dart';
import 'package:untitled_app/pages/home_page.dart';
import 'package:untitled_app/pages/link_first_page.dart';
import 'package:untitled_app/pages/login_page.dart';
import 'package:untitled_app/pages/sign_up.dart';
import 'package:untitled_app/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:untitled_app/providers/post_provider.dart';
// import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // ref.read(postsProvider.notifier).retrievePosts("somePostId", "someUserId");
  }

  @override
  void dispose() {
    super.dispose();
    // May need it to flush out the provider state
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: lightTheme,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/sign-up': (context) => const SignUpPage(),
        '/log-in': (context) => const LogInPage(),
        '/link-first': (context) => const LinkPage(),
        '/create-post': (context) => const CreatePostPage(),
      },
    );
  }
}
