import 'package:flutter/material.dart';
import 'package:untitled_app/providers/draft_provider.dart';

class DraftCard extends StatelessWidget {
  const DraftCard({super.key, required this.draft});

  final LocalDraft draft;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (draft.draft.imageUrl.isNotEmpty) ...[
                const SizedBox(
                  width: 300,
                  height: 100,
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1727437241854-c28c1a17e14b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8'),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("16/08/2024"), Text("3:30pm")],
                )
              ] else ...[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("16/08/2024"), Text("3:30pm")],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
