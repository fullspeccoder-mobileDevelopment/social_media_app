import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/components/form/email_form.dart';
import 'package:untitled_app/components/form/phone_firebase_form.dart';
import 'package:untitled_app/pages/otp_page.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart';
import 'package:untitled_app/utils/snack_utils.dart';

class PhoneLogInPage extends ConsumerStatefulWidget {
  const PhoneLogInPage({super.key});

  @override
  ConsumerState<PhoneLogInPage> createState() => _PhoneLogInPageState();
}

class _PhoneLogInPageState extends ConsumerState<PhoneLogInPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        "Phone",
        style: TextStyle(fontSize: 18),
      ),
    ),
    Tab(
      child: Text(
        "Email",
        style: TextStyle(fontSize: 18),
      ),
    ),
  ];
  late TabController _tabController;
  late Widget currentForm =
      PhoneFirebaseForm(codeSentAction: codeSentLoginAction);

  void codeSentLoginAction(String verificationId, int? resendToken) async {
    // Update the UI - wait for the user to enter the SMS code
    // String smsCode = '839213';
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => OTPPage(
                  verificationId: verificationId,
                  isSigningUp: false,
                )));

    if (mounted) {
      showSnackBarSuccessMessage(
          context, 'Successfully Logged In! Switching to Home Page...');
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, Routes.homeString);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enter into your account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                TabBar(
                  onTap: (value) {
                    ref.read(actionButtonProvider.notifier).state = false;
                    setState(() {
                      if (value == 1) {
                        currentForm = EmailForm();
                      } else {
                        currentForm = PhoneFirebaseForm(
                            codeSentAction: codeSentLoginAction);
                      }
                    });
                  },
                  controller: _tabController,
                  tabs: myTabs,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                const SizedBox(height: 75),
                currentForm,
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            FormBottomContent(
                bottomText: 'Already have an account?',
                bottomLink: 'Sign up',
                navigationMethod: () {
                  Navigator.popAndPushNamed(context, Routes.phoneSignUpString);
                }),
          ],
        ),
      ),
    );
  }
}
