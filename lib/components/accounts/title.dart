import 'package:flutter/material.dart';

class TitleLinkAccount extends StatelessWidget {
  const TitleLinkAccount({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const Text(
            "Link your first social account",
            style: TextStyle(fontSize: 27),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            "To post your content across different social media platform effortlessly, we need to connect to your social media channels.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          const SearchBar(
            leading: Icon(Icons.search),
            hintText: "Search",
          ),
        ],
      ),
    );
  }
}
