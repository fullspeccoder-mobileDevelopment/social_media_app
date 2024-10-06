import 'package:flutter/material.dart';
import 'package:untitled_app/components/account/social_media_card.dart';
import 'package:untitled_app/models/social_media.dart';

class AddableAccounts extends StatelessWidget {
  const AddableAccounts({
    super.key,
    required this.addableSocialMedias,
  });

  final Iterable<SocialMedia> addableSocialMedias;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Link more accounts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...addableSocialMedias
            .map((el) => SocialMediaCard(social: el, removable: false)),
      ],
    );
  }
}
