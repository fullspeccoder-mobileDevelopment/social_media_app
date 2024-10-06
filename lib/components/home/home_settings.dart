import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/components/misc/titled_textfield.dart';
import 'package:untitled_app/components/settings/addable_accounts.dart';
import 'package:untitled_app/components/settings/editable_avatar.dart';
import 'package:untitled_app/components/settings/removable_accounts.dart';
import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/models/social_media.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/settings_selected_accounts.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart';
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
  late FirebaseUser currentUser;

  @override
  void initState() {
    super.initState();

    currentUser = ref.read(userProvider).user;
  }

  Future<void> accountSettingsUpdate() async {
    final selectedAccounts = ref.watch(selectedAccountsProvider);
    ref.read(actionButtonProvider.notifier).state = true;

    if (emailController.text.isEmpty &&
        usernameController.text.isEmpty &&
        passwordController.text.isEmpty) {
      showSnackBarErrorMessage(context,
          'Username, email, & password are all empty\nNothing to update');
      return;
    }

    for (var account in selectedAccounts) {
      ref.read(userProvider).user.accessTokens.remove(account);
    }

    try {
      await ref
          .read(userProvider.notifier)
          .updateUserDetails(currentUser.copyWith(
            email: emailController.text.isEmpty
                ? currentUser.email
                : emailController.text,
            username: usernameController.text.isEmpty
                ? currentUser.username
                : usernameController.text,
          ) /*, password: passwordController.text*/);

      if (mounted) {
        ref.read(actionButtonProvider.notifier).state = false;
        showSnackBarSuccessMessage(
            context, 'Successfully updated user credentials!');
        Navigator.popAndPushNamed(context, Routes.homeString);
      }
    } catch (e) {
      if (mounted) {
        showSnackBarErrorMessage(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final accessTokensAvailable = currentUser.accessTokens.keys.toList();
    final removableSocialMedias =
        socialMedias.where((el) => accessTokensAvailable.contains(el.codeName));
    final addableSocialMedias = socialMedias
        .where((el) => !accessTokensAvailable.contains(el.codeName));

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
                if (removableSocialMedias.isNotEmpty) ...[
                  RemovableAccounts(
                      removableSocialMedias: removableSocialMedias),
                ],
                AddableAccounts(addableSocialMedias: addableSocialMedias),
                const SizedBox(height: 35),
                PrimaryButton(callback: accountSettingsUpdate, text: 'Save'),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
