import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/utils/validation_checking.dart';

class PlatformDropdown extends ConsumerWidget {
  const PlatformDropdown(
      {super.key, required this.text, required this.platformController});

  final TextEditingController platformController;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          DropdownMenu(
            errorText: validate(
              textToValidate: platformController.text,
              buttonPressed: ref.watch(actionButtonProvider),
              message: 'Platform is empty or invalid',
            ),
            controller: platformController,
            menuStyle: const MenuStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromRGBO(223, 242, 255, 1))),
            width: 358,
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                ),
                value: "Facebook",
                label: "Facebook",
                trailingIcon: Image(
                  image: AssetImage('assets/images/facebook.png'),
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                value: "Instagram",
                label: "Instagram",
                trailingIcon: Image(
                  image: AssetImage('assets/images/instagram.png'),
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                value: "Twitter(X)",
                label: "Twitter(X)",
                trailingIcon: Image(
                  image: AssetImage('assets/images/x.png'),
                ),
              ),
              DropdownMenuEntry(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                value: "LinkedIn",
                label: "LinkedIn",
                trailingIcon: Image(
                  image: AssetImage('assets/images/linkedin.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
