String? validate({
  required String textToValidate,
  required bool buttonPressed,
  required message,
}) {
  return textToValidate.isEmpty && buttonPressed ? message : null;
}
