import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/account/card.dart';
import 'package:untitled_app/components/account/title.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/providers/user_provider.dart';

class LinkPage extends ConsumerStatefulWidget {
  const LinkPage({super.key});

  @override
  ConsumerState<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends ConsumerState<LinkPage> {
  TextEditingController searchController = TextEditingController();

  Future<void> Function()? provideAuthFunction(String social) {
    final notifier = ref.read(userProvider.notifier);
    switch (social) {
      case "twitter":
        return notifier.logInWithTwitter;
      default:
        print("Social not applicable");
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26.0, 0, 26, 26),
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
                          socialMedia: social.socialName,
                          authCallback: provideAuthFunction('twitter'),
                          removable: false,
                        ))
                    .toList(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/request-social',
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Request a Social Media",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
