import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/account/card.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/components/misc/titled_textfield.dart';
import 'package:untitled_app/components/settings/editable_avatar.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/snack_utils.dart';

class HomeSettings extends ConsumerStatefulWidget {
  const HomeSettings({super.key});

  @override
  ConsumerState<HomeSettings> createState() => _HomeSettingsState();
}

class _HomeSettingsState extends ConsumerState<HomeSettings> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(userProvider).user;
    return ListView(children: [
      Column(
        children: [
          const Divider(height: 1, color: Colors.black26),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const EditableAvatar(),
                const SpacedDivider(
                  whitespace: 35,
                  thickness: 1,
                  color: Colors.black12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "General Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TitledTextField(
                  text: 'Username',
                  controller: usernameController,
                  labelText: currentUser.username,
                ),
                const SizedBox(height: 15),
                TitledTextField(
                  text: 'Email',
                  controller: emailController,
                  labelText: currentUser.email,
                ),
                const SizedBox(height: 15),
                TitledTextField(
                  text: 'Password',
                  controller: passwordController,
                  isPassword: true,
                ),
                const SpacedDivider(
                  whitespace: 35,
                  thickness: 1,
                  color: Colors.black12,
                ),
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
                SocialMediaCard(
                  social: socialMedias.first,
                  removable: true,
                ),
                SocialMediaCard(
                  social: socialMedias[1],
                  removable: true,
                ),
                const SizedBox(height: 35),
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
                SocialMediaCard(
                  social: socialMedias[2],
                  removable: false,
                ),
                SocialMediaCard(
                  social: socialMedias[3],
                  removable: false,
                ),
                SocialMediaCard(
                  social: socialMedias.last,
                  removable: false,
                ),
                const SizedBox(height: 35),
                PrimaryButton(
                    callback: () async {
                      try {
                        await ref
                            .read(userProvider.notifier)
                            .updateUserDetails(currentUser.copyWith(
                              email: emailController.text,
                              username: usernameController.text,
                            ));
                        if (context.mounted) {
                          showSnackBarSuccessMessage(context,
                              'Successfully updated user credentials!');
                        }
                      } catch (e) {
                        if (context.mounted) {
                          showSnackBarErrorMessage(context, e);
                        }
                      }
                    },
                    text: 'Save'),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
