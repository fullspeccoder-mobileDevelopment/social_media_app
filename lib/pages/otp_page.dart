import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/user_provider.dart';

class OTPPage extends ConsumerStatefulWidget {
  final String verificationId;

  final bool isSigningUp;

  const OTPPage(
      {super.key, required this.verificationId, required this.isSigningUp});

  @override
  ConsumerState<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends ConsumerState<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              children: [
                Text("Enter verification code"),
                Text(
                    "We have just sent a 4-digit verification code to your phone number via SMS to verify that its you."),
              ],
            ),
          ),
          Column(
            children: [
              const Text("Enter OTP"),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                showFieldAsBox: true,
                onSubmit: (verificationCode) {
                  if (widget.isSigningUp) {
                    ref.read(userProvider.notifier).signUpWithPhoneNumber(
                        widget.verificationId, verificationCode);
                  }
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
