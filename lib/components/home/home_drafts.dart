import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/home/draft_card.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/providers/draft_provider.dart';

class HomeDrafts extends ConsumerWidget {
  const HomeDrafts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drafts = ref.watch(draftProvider);

    if (drafts.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.5),
        child: ListView.builder(
          itemCount: drafts.length,
          itemBuilder: (_, index) => DraftCard(draft: drafts[index]),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 400,
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/drafts.png",
                    width: 300,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Seems like you don't have any draft\navailable here, plan content and save ideas\nto create your first draft.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(106, 106, 106, 1),
                    ),
                  ),
                  PrimaryButton(
                    callback: () {
                      Navigator.of(context).pushNamed('/create-post');
                    },
                    text: 'Create my first draft',
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
