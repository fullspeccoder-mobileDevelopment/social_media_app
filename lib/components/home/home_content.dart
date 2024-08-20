import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

/// Holds the main content of the home page
///
/// Contains an image for the mobile bro image, text, and a text reading snapshot.
/// Will eventually contain a list of the posts made by the user
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 400,
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/mobile_bro.png",
                    width: 300,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet consectetur. Ornare sit enim vitae ullamcorper.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(106, 106, 106, 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: PrimaryButtonStyle(),
                    child: const Text(
                      "Upload your first shot",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
