import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/home/home_drafts.dart';
import 'package:untitled_app/components/home/home_posts.dart';
import 'package:untitled_app/providers/home_nav_provider.dart';

/// Holds the main content of the home page
///
/// Contains an image for the mobile bro image, text, and a text reading snapshot.
/// Will eventually contain a list of the posts made by the user
class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentPageSelection = ref.watch(homeNavProvider);
    switch (currentPageSelection) {
      case 0:
        return const HomePosts();
      case 1:
        return const HomeDrafts();
      case 2:
        throw UnimplementedError("Statistics Page not created");
      // return const HomeStatistics();
      case 3:
        throw UnimplementedError("Settings Page not created");
      // return const HomeSettings();
      default:
        return const Scaffold(
          body: Text("Oh No!!!!"),
        );
    }
  }
}
