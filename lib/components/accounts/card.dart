import 'package:flutter/material.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard(
      {super.key, required this.imagePath, required this.socialMedia});
  final String imagePath;
  final String socialMedia;

  @override
  Widget build(BuildContext context) {
    return Card(
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
