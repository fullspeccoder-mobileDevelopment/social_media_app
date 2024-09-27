import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled_app/providers/image_provider.dart';

class ImagePickerContainer extends ConsumerStatefulWidget {
  const ImagePickerContainer({super.key});

  @override
  ConsumerState<ImagePickerContainer> createState() =>
      _ImagePickerContainerState();
}

class _ImagePickerContainerState extends ConsumerState<ImagePickerContainer> {
  final picker = ImagePicker();
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final notifier = ref.read(imageProvider.notifier);
    if (pickedFile != null) {
      print(pickedFile.path);
      notifier.getImageFile(pickedFile.path);
    }
  }

//Image Picker function to get image from camera
  Future pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    final notifier = ref.read(imageProvider.notifier);

    if (pickedFile != null) {
      notifier.getImageFile(pickedFile.path);
    }
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              pickImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(imageProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 30),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        dashPattern: const [10, 5],
        color: image == null ? Colors.black26 : Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(left: 85, right: 85),
          height: 200,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: showOptions,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: image == null
                      ? const Image(
                          image: AssetImage(
                              "assets/images/man-uploading-data.png"))
                      : Image.file(
                          width: 600,
                          image,
                        ),
                ),
              ),
              image != null
                  ? const Text("")
                  : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                      ),
                      onPressed: showOptions,
                      child: const Text(
                        "Upload from device",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
