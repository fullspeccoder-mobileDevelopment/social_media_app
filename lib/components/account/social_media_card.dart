import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/sheets/congratulations_sheet.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/providers/settings_selected_accounts.dart';
import 'package:untitled_app/utils/nav_utils.dart';
import 'package:untitled_app/utils/snack_utils.dart';
import 'package:untitled_app/utils/social_media_delegate.dart';

class SocialMediaCard extends ConsumerStatefulWidget {
  final SocialMedia social;
  final bool removable;

  const SocialMediaCard({
    super.key,
    required this.social,
    required this.removable,
  });

  @override
  ConsumerState<SocialMediaCard> createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends ConsumerState<SocialMediaCard> {
  Future<void> authenticateSocial() async {
    // Grabs authentication function
    final authenticateFunc =
        SocialMediaDelegate.provideAuthFunction(widget.social.codeName, ref);

    // Checks if function is null, then sends error message back
    if (authenticateFunc == null) {
      showSnackBarErrorMessage(context,
          'Error! Authentication function not implemented into application');
      return;
    }

    showSnackBarSuccessMessage(
        context, 'Redirecting to authentication for social...');

    // Trys to authenticate the user & if successful, sends a congrats sheet
    try {
      await authenticateFunc();
      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => const CongratulationsSheet(),
        );
        Navigator.popAndPushNamed(context, Routes.homeString);
      }
    } catch (e) {
      // Sends user message if authentication was unsuccessful
      if (mounted) showSnackBarErrorMessage(context, e);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.social.filePath,
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
                      widget.social.socialName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Link your ${widget.social.socialName} account",
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
              onPressed: !widget.removable
                  ? authenticateSocial
                  : () {
                      ref
                          .read(selectedAccountsProvider)
                          .add(widget.social.codeName);
                    },
              icon: widget.removable
                  ? const Icon(Icons.indeterminate_check_box_rounded,
                      color: Colors.red)
                  : const Icon(
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
