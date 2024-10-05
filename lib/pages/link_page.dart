import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/account/card.dart';
import 'package:untitled_app/components/account/title.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/utils/nav_utils.dart';

class LinkPage extends ConsumerStatefulWidget {
  const LinkPage({super.key});

  @override
  ConsumerState<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends ConsumerState<LinkPage> {
  TextEditingController searchController = TextEditingController();
  List<SocialMedia> filteredSocialMedias = [];

  @override
  void initState() {
    super.initState();
    filteredSocialMedias = socialMedias;
  }

  void filterList() {
    print(searchController.text);
    setState(() {
      filteredSocialMedias = socialMedias
          .where((social) =>
              social.codeName.toLowerCase().contains(searchController.text))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26.0, 0, 26, 26),
        child: ListView(
          children: [
            TitleLinkAccount(
                searchController: searchController, filter: filterList),
            ...filteredSocialMedias.map(
                (social) => SocialMediaCard(social: social, removable: false)),
            PrimaryButton(
                callback: () {
                  Navigator.pushNamed(context, Routes.requestSocialString);
                },
                text: 'Request a Social Media')
          ],
        ),
      ),
      // bottomNavigationBar:
    );
  }
}











/* Old Code */
// TextButton(
//   style: TextButton.styleFrom(
//       backgroundColor: Colors.blue,
//       minimumSize: const Size(200, 50),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25))),
//   onPressed: () {
//     Navigator.pushNamed(context, Routes.requestSocialString);
//   },
//   child: const Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Text(
//       "Request a Social Media",
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//       ),
//     ),
//   ),
// ),