import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/models/post.dart';
import 'package:untitled_app/providers/post_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController platformController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    final posts = ref.watch(postsProvider).posts;
    print(posts);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Post your shot",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
          //$ Title
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title"),
                TextField(controller: titleController),
              ],
            ),
          ),
          //$ Select Platform
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select Platform:"),
                DropdownMenu(
                  controller: platformController,
                  menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(223, 242, 255, 1))),
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
          ),
          //$ Date
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Schedule Post (Optional)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateTimeFormField(
                      decoration: InputDecoration(
                          constraints:
                              BoxConstraints.tight(const Size(170, 50))),
                      mode: DateTimeFieldPickerMode.date,
                      initialPickerDateTime: DateTime.now(),
                      onChanged: (DateTime? value) {
                        selectedDate = value ?? DateTime.now();
                      },
                      validator: (value) =>
                          value!.second > DateTime.now().second
                              ? null
                              : "Date is in the past",
                    ),
                    DateTimeFormField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.access_time),
                          constraints:
                              BoxConstraints.tight(const Size(170, 50))),
                      mode: DateTimeFieldPickerMode.time,
                      initialPickerDateTime: DateTime.now(),
                      onChanged: (DateTime? value) {
                        selectedTime = value ?? DateTime.now();
                      },
                      validator: (value) =>
                          value!.second > DateTime.now().second
                              ? null
                              : "Date is in the past",
                    ),
                  ],
                )
              ],
            ),
          ),
          //$ Tags
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Add Tags (Optional)"),
                TextField(
                  maxLines: 2,
                  controller: tagController,
                ),
              ],
            ),
          ),
          //$ Image
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 30),
            height: 200,
            width: 600,
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const Image(
                      image:
                          AssetImage("assets/images/man-uploading-data.png")),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    fixedSize: const Size(100, 50),
                  ),
                  onPressed: null,
                  child: const Text(
                    "Upload from device",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          //$ TextButton
          PrimaryButton(callback: () {
            final selectedDateTime = selectedDate.copyWith(
                hour: selectedTime.hour, minute: selectedTime.minute);
            final post = Post(
              content: 'some content here',
              imageUrl: 'some image url here',
              userId: user.id,
              tags: [tagController.text],
              postDate: Timestamp.fromDate(selectedDateTime),
            );
            ref.read(postsProvider.notifier).createPost(post);
            Navigator.of(context).popAndPushNamed('/home');
          }),
        ],
      ),
    ));
  }
}






  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }