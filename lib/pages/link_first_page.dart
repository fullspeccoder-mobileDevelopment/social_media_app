import 'package:flutter/material.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/styles/input_styles.dart';

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
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    const Text(
                      "Link your first social account",
                      style: TextStyle(fontSize: 27),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "To post your content across different social media platform effortlessly, we need to connect to your social media channels.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: searchController,
                      decoration: const SearchDecoration(),
                    ),
                  ],
                ),
              ),
              //& Todo: This might be the problem for the ParentDataWidget that needs to be fixed
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
                style: PrimaryButtonStyle(
                  radius: 35,
                  size: const Size(200, 25),
                ),
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

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard(
      {super.key, required this.imagePath, required this.socialMedia});
  final String imagePath;
  final String socialMedia;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(223, 242, 255, 1),
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      socialMedia,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Link your $socialMedia account",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              iconSize: 25,
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_rounded,
                color: Color.fromRGBO(48, 155, 215, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
