import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

//String Tags
class TextFieldTagsContainer extends StatefulWidget {
  const TextFieldTagsContainer({super.key, required this.controller});

  final StringTagController controller;

  @override
  State<TextFieldTagsContainer> createState() => _TextFieldTagsContainerState();
}

class _TextFieldTagsContainerState extends State<TextFieldTagsContainer> {
  late double _distanceToField;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldTags<String>(
          textfieldTagsController: widget.controller,
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          inputFieldBuilder: (context, inputFieldValues) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: inputFieldValues.textEditingController,
                focusNode: inputFieldValues.focusNode,
                decoration: InputDecoration(
                  hintText:
                      inputFieldValues.tags.isNotEmpty ? '' : "Enter tag...",
                  prefixIconConstraints:
                      BoxConstraints(maxWidth: _distanceToField * 0.75),
                  prefixIcon: inputFieldValues.tags.isNotEmpty
                      ? SingleChildScrollView(
                          controller: inputFieldValues.tagScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: inputFieldValues.tags.map((String tag) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Colors.black54,
                              ),
                              margin: const EdgeInsets.only(right: 10.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Text(
                                      '#$tag',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  InkWell(
                                    child: const Icon(
                                      Icons.cancel,
                                      size: 14.0,
                                      color: Color.fromARGB(255, 233, 233, 233),
                                    ),
                                    onTap: () {
                                      inputFieldValues.onTagRemoved(tag);
                                    },
                                  )
                                ],
                              ),
                            );
                          }).toList()),
                        )
                      : null,
                ),
                onChanged: inputFieldValues.onTagChanged,
                onSubmitted: inputFieldValues.onTagSubmitted,
              ),
            );
          },
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.blueAccent,
            ),
          ),
          onPressed: () {
            widget.controller.clearTags();
          },
          child: const Text(
            'CLEAR TAGS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
