import 'package:flutter/material.dart';
import 'package:untitled_app/components/accounts/card.dart';
import 'package:untitled_app/components/accounts/title.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/styles/button_styles.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleLinkAccount(searchController: searchController),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: socialMedias
                      .map((social) => SocialMediaCard(
                          imagePath: social.filePath,
                          socialMedia: social.socialName))
                      .toList(),
                ),
              ),
              TextButton(
                style: PrimaryButtonStyle(),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Request a Social Media",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
