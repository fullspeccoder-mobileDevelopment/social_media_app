import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/snack_utils.dart';
import 'package:untitled_app/utils/validation_checking.dart';

class PhoneFirebaseForm extends ConsumerStatefulWidget {
  const PhoneFirebaseForm({super.key, required this.codeSentAction});

  final void Function(String verificationId, int? resendToken) codeSentAction;

  @override
  ConsumerState<PhoneFirebaseForm> createState() => _PhoneFirebaseFormState();
}

class _PhoneFirebaseFormState extends ConsumerState<PhoneFirebaseForm> {
  final TextEditingController areaCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String? currentFlag;

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.read(userProvider.notifier);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenu(
              errorText: validate(
                textToValidate: areaCodeController.text,
                buttonPressed: ref.watch(actionButtonProvider),
                message: 'Invalid',
              ),
              label: Text(currentFlag ?? ""),
              controller: areaCodeController,
              menuStyle: const MenuStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromRGBO(223, 242, 255, 1)),
              ),
              width: 115,
              onSelected: (value) {
                setState(() {
                  currentFlag = (value == '+1') ? "🇺🇸" : "🇮🇳";
                });
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                    ),
                    value: "+91",
                    label: "+91",
                    leadingIcon: Text("🇮🇳")),
                DropdownMenuEntry(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  value: "+1",
                  label: "+1",
                  leadingIcon: Text("🇺🇸"),
                ),
              ],
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                  errorText: validate(
                    textToValidate: mobileController.text,
                    buttonPressed: ref.watch(actionButtonProvider),
                    message: 'Phone number is empty or invalid',
                  ),
                  labelText: 'Mobile',
                  hintText: "Enter your phone number",
                  constraints: BoxConstraints.loose(const Size(270, 75))),
            ),
          ],
        ),
        const SpacedDivider(whitespace: 25, color: Colors.grey),
        PrimaryButton(
          callback: () async {
            ref.read(actionButtonProvider.notifier).state = true;
            try {
              await userNotifier.verifyWithPhoneNumber(
                areaCodeController.text,
                mobileController.text,
                codeSent: widget.codeSentAction,
              );
            } catch (e) {
              if (context.mounted) showSnackBarErrorMessage(context, e);
            }
          },
          text: 'Send Code',
        ),
      ],
    );
  }
}
