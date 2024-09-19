import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled_app/styles/theme.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;
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
        r.Route.splashString: r.Route.splashRoute,
        r.Route.homeString: r.Route.homeRoute,
        r.Route.signUpString: r.Route.signUpRoute,
        r.Route.phoneSignUpString: r.Route.phoneSignUpRoute,
        r.Route.logInString: r.Route.logInRoute,
        r.Route.linkString: r.Route.linkRoute,
        r.Route.createPostString: r.Route.createPostRoute,
        r.Route.calendarString: r.Route.calendarRoute,
        r.Route.postHistoryString: r.Route.postHistoryRoute,
        r.Route.profileString: r.Route.profileRoute,
        r.Route.supportString: r.Route.supportRoute,
        r.Route.requestSocialString: r.Route.requestSocialRoute,
      },
    );
  }
}
