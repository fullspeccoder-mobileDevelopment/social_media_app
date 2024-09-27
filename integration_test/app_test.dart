import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/firebase_options.dart';
import 'package:untitled_app/main.dart';
import 'package:integration_test/integration_test.dart';
import 'package:untitled_app/pages/splash_page.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      Finder welcomeTextWidget = find.text("Welcome!");

      expect(welcomeTextWidget, findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));

      await tester.pumpAndSettle();

      Finder signUpTextWidget = find.text("Sign up for");

      expect(signUpTextWidget, findsOneWidget);

      Finder formBottomContentWidget = find.byType(FormBottomContent);

      expect(formBottomContentWidget, findsOneWidget);

      const linkTextKey = ValueKey('link-text');

      expect(find.byKey(linkTextKey), findsOneWidget);

      // await tester.tap(logInTextWidget);

      await tester.pumpAndSettle();

      Finder logInFormTextWidget = find.text("Log in to");

      expect(logInFormTextWidget, findsOneWidget);
    });
  });
}
