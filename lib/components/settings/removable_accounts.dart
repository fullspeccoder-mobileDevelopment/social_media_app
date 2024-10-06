import 'package:flutter/material.dart';
import 'package:untitled_app/components/account/social_media_card.dart';
import 'package:untitled_app/models/social_media.dart';

class RemovableAccounts extends StatelessWidget {
  const RemovableAccounts({
    super.key,
    required this.removableSocialMedias,
  });

  final Iterable<SocialMedia> removableSocialMedias;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Linked Accounts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...removableSocialMedias.map(
          (el) => SocialMediaCard(social: el, removable: true),
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}
