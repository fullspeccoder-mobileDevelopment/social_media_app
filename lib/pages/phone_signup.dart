import 'package:flutter/material.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/components/form/email_form.dart';
import 'package:untitled_app/components/form/phone_form.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({super.key});

  @override
  State<PhoneSignUp> createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp>
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
  Widget currentForm = const PhoneForm();

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
                      "Sign up for",
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Create your account",
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
                    setState(() {
                      if (value == 1) {
                        currentForm = EmailForm();
                      } else {
                        currentForm = const PhoneForm();
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
                bottomLink: 'Log in',
                navigationMethod: () {
                  Navigator.popAndPushNamed(context, '/log-in');
                }),
          ],
        ),
      ),
    );
  }
}
