import 'package:flutter/material.dart';
import 'package:untitled_app/pages/confirmation_page.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/utils/send_social_request.dart';

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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const ConfirmationPage(
                  detailMessage:
                      'Your request for adding a new social media\nplatform is successfully sent and will be\nreviewed shortly.',
                  titleMessage: 'Congratulations!')));
    } catch (e) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const ConfirmationPage(
                  detailMessage:
                      'Your request could not be completed at this time.',
                  titleMessage: 'Error!')));
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        controller: nameController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Link",
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        controller: linkController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: handleRequest,
                    style: PrimaryButtonStyle(),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
