import 'package:flutter/material.dart';
import 'package:untitled_app/pages/confirmation_page.dart';

void popAndPushSignUpMessageConfirmation(BuildContext context) {
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ConfirmationPage(
        titleMessage: "Congratulations!",
        detailMessage: "You have officially signed up for CrossMedia!",
      ),
    ),
  );
}
