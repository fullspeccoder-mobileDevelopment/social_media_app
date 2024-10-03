import 'package:flutter/material.dart';

/// Shows a snack bar error message using the context from the current widget
void showSnackBarErrorMessage(BuildContext context, Object e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(e.toString()),
    ),
  );
}

/// Shows a snack bar success message using the context from the current widget
void showSnackBarSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

/// Shows a snack bar sign up process message using context from the current widget
void showSnackBarSignUpProcessingMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(milliseconds: 750),
      content: Text('Signing you up...'),
    ),
  );
}

/// Shows a snack bar log in process message using context from the current widget
void showSnackBarLogInProcessingMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(milliseconds: 750),
      content: Text('Logging you in...'),
    ),
  );
}
