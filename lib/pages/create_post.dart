import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:untitled_app/components/create/date_container.dart';
import 'package:untitled_app/components/create/image_picker_container.dart';
import 'package:untitled_app/components/create/platform_dropdown.dart';
import 'package:untitled_app/components/create/text_input_container.dart';
import 'package:untitled_app/components/create/text_input_container_extended.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/providers/date_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/post_maker.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController platformController = TextEditingController();
  StringTagController stringTagController = StringTagController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    final date = ref.watch(dateProvider);
    final postMaker = PostMaker(ref: ref);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(36.0),
      child: ListView(
        children: [
          const Text(
            "Post your shot",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
          //$ Title
          TextInputContainer(text: "Title", controller: titleController),
          //$ Select Platform
          PlatformDropdown(
              text: "Select Platform:", platformController: platformController),
          //$ Date
          const DateContainer(),
          //$ Tags
          TextInputContainerExtended(
            text: "Add tags (Optional)",
            child: TextFieldTags<String>(
              textfieldTagsController: stringTagController,
              textSeparators: const [' '],
              inputFieldBuilder: (_, inputFieldValues) {
                return TextField(
                  maxLines: 2,
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                );
              },
            ),
          ),
          //$ Description
          TextInputContainerExtended(
            text: "Description (Optional)",
            child: TextField(
              maxLines: 4,
              controller: descriptionController,
            ),
          ),
          //$ Image
          const ImagePickerContainer(),
          //$ TextButton
          PrimaryButton(
            callback: () {
              postMaker.makePost({
                'content': descriptionController.text,
                'imageUrl': 'some image url here',
                'userId': user.id,
                'tags': stringTagController.getTags ?? [],
                'postDate': Timestamp.fromDate(date),
              }, platformController.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    ));
  }
}
