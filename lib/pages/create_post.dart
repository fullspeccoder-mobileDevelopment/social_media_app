import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:untitled_app/components/create/date_container.dart';
import 'package:untitled_app/components/create/image_picker_container.dart';
import 'package:untitled_app/components/create/platform_dropdown.dart';
import 'package:untitled_app/components/create/text_input_container.dart';
import 'package:untitled_app/components/create/text_input_container_extended.dart';
import 'package:untitled_app/components/create/textfield_container.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/date_provider.dart';
import 'package:untitled_app/providers/image_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/path_manipulation.dart';
import 'package:untitled_app/utils/post_maker.dart';
import 'package:untitled_app/utils/snack_utils.dart';
import 'package:untitled_app/utils/validation_checking.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage>
    with RouteAware {
  TextEditingController titleController = TextEditingController();
  TextEditingController platformController = TextEditingController();
  StringTagController textfieldTagsController = StringTagController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    final date = ref.watch(dateProvider);
    final String? imagePath = ref.watch(imageProvider)?.path;
    final postMaker = PostMaker(ref: ref);
    return PopScope(
      onPopInvoked: (value) {
        if (value) {
          postMaker.makeDraft(
              descriptionController.text, textfieldTagsController.getTags);
        }
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(36.0, 0, 36, 36),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(actionButtonProvider.notifier).state = false;
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                )
              ],
            ),
            const Text(
              "Post your shot",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            //$ Title
            TextInputContainer(text: "Title", controller: titleController),
            //$ Select Platform
            PlatformDropdown(
                text: "Select Platform:",
                platformController: platformController),
            //$ Date
            const DateContainer(),
            //$ Tags
            TextInputContainerExtended(
              text: "Add tags (Optional)",
              child:
                  TextFieldTagsContainer(controller: textfieldTagsController),
            ),
            //$ Description
            TextInputContainerExtended(
              text: "Description (Optional)",
              child: TextField(
                maxLines: 4,
                controller: descriptionController,
                decoration: InputDecoration(
                  errorText: validate(
                    textToValidate: descriptionController.text,
                    buttonPressed: ref.watch(actionButtonProvider),
                    message: 'Description is empty or invalid',
                  ),
                ),
              ),
            ),
            //$ Image
            const ImagePickerContainer(),
            //$ TextButton
            // TODO Validation is needed otherwise error
            PrimaryButton(
              text: 'Continue',
              callback: () {
                ref.read(actionButtonProvider.notifier).state = true;
                if (descriptionController.text.isEmpty ||
                    user.id == 'defaultUser' ||
                    platformController.text.isEmpty) {
                  showSnackBarErrorMessage(context,
                      "Needs description, user, or at least one platform...");
                  return;
                }
                postMaker.makePost({
                  'content': descriptionController.text,
                  'imageUrl': getFileNameFromAbsolutePath(imagePath!),
                  'userId': user.id,
                  'tags': textfieldTagsController.getTags ?? [],
                  'postDate': Timestamp.fromDate(date),
                }, platformController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      )),
    );
  }
}
