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
