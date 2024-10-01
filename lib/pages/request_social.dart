import 'package:flutter/material.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/components/misc/titled_textfield.dart';
import 'package:untitled_app/utils/send_social_request.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;

class RequestSocial extends StatefulWidget {
  const RequestSocial({super.key});

  @override
  State<RequestSocial> createState() => _RequestSocialState();
}

class _RequestSocialState extends State<RequestSocial> {
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  void handleRequest() {
    final socialRequest = SocialRequest();
    try {
      socialRequest.sendRequest(nameController.text, linkController.text);
      Navigator.push(context, r.Route.successfulSocialRequest);
    } catch (e) {
      Navigator.push(context, r.Route.failedRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 100, 32, 0),
          child: Column(
            children: [
              const Column(
                children: [
                  Text(
                    "Request a Social Media",
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Request your favourite social media\nplatform and we will try our best to bring it\nonboard as soon as possible",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  TitledTextField(text: 'Name', controller: nameController),
                  const SizedBox(height: 25),
                  TitledTextField(text: 'Link', controller: linkController),
                  const SpacedDivider(
                    color: Colors.grey,
                    thickness: 1,
                    whitespace: 20,
                  ),
                  PrimaryButton(callback: handleRequest, text: 'Continue'),
                ],
              )
            ],
          ),
        ));
  }
}
