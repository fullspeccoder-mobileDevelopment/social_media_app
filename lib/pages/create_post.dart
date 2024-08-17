import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
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
          ),
          //$ Title
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title"),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
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
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(
                      value: "Facebook",
                      child: Image(
                        image: AssetImage("assets/images/facebook.png"),
                      ),
                    ),
                  ],
                  onChanged: null,
                )
              ],
            ),
          ),
          //$ Date
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Schedule Post (Optional)"),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //$ Tags
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Tags (Optional)"),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //$ Image
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
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
                  style: PrimaryButtonStyle(
                    size: const Size(200, 50),
                    radius: 6,
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
          TextButton(
            style: PrimaryButtonStyle(),
            onPressed: null,
            child:
                const Text("Continue", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ));
  }
}
