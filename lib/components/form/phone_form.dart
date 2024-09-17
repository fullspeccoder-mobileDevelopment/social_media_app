import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/pages/otp_page.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/utils/snack_utils.dart';

class PhoneForm extends ConsumerStatefulWidget {
  const PhoneForm({super.key});

  @override
  ConsumerState<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends ConsumerState<PhoneForm> {
  final TextEditingController areaCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.read(userProvider.notifier);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenu(
              controller: areaCodeController,
              menuStyle: const MenuStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(223, 242, 255, 1))),
              width: 100,
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  value: "+91",
                  label: "+91",
                ),
                DropdownMenuEntry(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                  value: "+1",
                  label: "+1",
                ),
              ],
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                  labelText: 'Mobile',
                  hintText: "Enter your phone number",
                  constraints: BoxConstraints.loose(const Size(270, 75))),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(color: Colors.grey),
        const SizedBox(height: 15),
        TextButton(
          style: PrimaryButtonStyle(),
          onPressed: () {
            userNotifier.verifyWithPhoneNumber(
              areaCodeController.text,
              mobileController.text,
              codeSent: (verificationId, resendToken) async {
                print('Code Sent');
                // Update the UI - wait for the user to enter the SMS code
                // String smsCode = '839213';
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OTPPage(
                              verificationId: verificationId,
                              isSigningUp: true,
                            )));

                showSnackBarSuccessMessage(context,
                    'Successfully Signed Up! Switching to Home Page...');
                await Future.delayed(const Duration(seconds: 1));
                Navigator.popAndPushNamed(context, '/home');
              },
            );
          },
          child: const Text(
            "Send Code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
