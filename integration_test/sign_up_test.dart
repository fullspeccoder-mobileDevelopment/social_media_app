import 'dart:js_interop_unsafe';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/firebase_options.dart';
import 'package:untitled_app/main.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAuth auth = FirebaseAuth.instance;

  group('Sign up testing', () {
    testWidgets('Signs user up in Firebase and returns to home screen.',
        (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      await Future.delayed(const Duration(seconds: 2));

      await tester.pumpAndSettle();

      Finder textFields = find.byType(TextField);

      expect(textFields, findsWidgets);

      Finder usernameField = textFields.first;
      Finder passwordField = textFields.last;

      expect(usernameField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      await tester.enterText(usernameField, 'test_email@gmail.com');
      await tester.enterText(passwordField, '1234password\$');

      Finder continueButton = find.byKey(const ValueKey('form-key'));

      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder congratsButton = find.byKey(const ValueKey('confirm-key'));

      expect(congratsButton, findsOneWidget);

      await tester.tap(congratsButton);

      await tester.pumpAndSettle();
    });

    testWidgets('Cannot sign up with similar email', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      await Future.delayed(const Duration(seconds: 2));

      await tester.pumpAndSettle();

      Finder textFields = find.byType(TextField);

      expect(textFields, findsWidgets);

      Finder usernameField = textFields.first;
      Finder passwordField = textFields.last;

      expect(usernameField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      await tester.enterText(usernameField, 'test_email@gmail.com');
      await tester.enterText(passwordField, '1234password\$');

      Finder continueButton = find.byKey(const ValueKey('form-key'));

      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);

      await tester.pump();

      Finder snackBarErrorMessage = find.text(
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.');

      expect(snackBarErrorMessage, findsOneWidget);
    });
  });

  // tearDownAll(() {
  //   auth.collection("users").delete(property)
  // });
}
