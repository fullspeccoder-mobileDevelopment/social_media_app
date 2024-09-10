import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/account/card.dart';
import 'package:untitled_app/components/account/title.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';

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
                            socialMedia: social.socialName,
                            authCallback: provideAuthFunction('twitter'),
                          ))
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
