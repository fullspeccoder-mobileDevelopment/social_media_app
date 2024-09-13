import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final TextEditingController areaCodeController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenu(
              controller: areaCodeController,
              menuStyle: const MenuStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(223, 242, 255, 1))),
              width: 100,
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  value: "+91",
                  label: "+91",
                ),
                DropdownMenuEntry(
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                  value: "+1",
                  label: "+1",
                ),
              ],
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                  labelText: 'Mobile',
                  hintText: "Enter your phone number",
                  constraints: BoxConstraints.loose(const Size(270, 75))),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(color: Colors.grey),
        const SizedBox(height: 15),
        TextButton(
          style: PrimaryButtonStyle(),
          onPressed: null,
          child: const Text(
            "Send Code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
