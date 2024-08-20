import 'package:flutter/material.dart';

//& TODO: Implement SnackBar (See Flutter Documentation)
void showSnackBarErrorMessage(BuildContext context, Object e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(e.toString()),
  ));
}

//& TODO: Implement SnackBar (See Flutter Documentation)
void showSnackBarSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
