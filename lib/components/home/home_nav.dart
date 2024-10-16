import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/home_nav_provider.dart';

/// Bottom navigation bar for the home screen
///
/// Will allow the user to move between a few pages within the application.
class BottomHomeNavbar extends ConsumerStatefulWidget {
  const BottomHomeNavbar({super.key});

  @override
  ConsumerState<BottomHomeNavbar> createState() => _BottomHomeNavbarState();
}

class _BottomHomeNavbarState extends ConsumerState<BottomHomeNavbar> {
  void changePage(int value) {
    ref.read(homeNavProvider.notifier).state = value;
  }

  Widget determineIconState(IconData iconData, int index) {
    if (ref.read(homeNavProvider.notifier).state == index) {
      return Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.only(bottom: 5, top: 15),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(iconData),
      );
    }
    return Icon(iconData);
  }

  @override
  Widget build(BuildContext context) {
    final currentNavButton = ref.watch(homeNavProvider);
    return BottomNavigationBar(
      currentIndex: currentNavButton,
      onTap: changePage,
      items: [
        BottomNavigationBarItem(
          icon: determineIconState(Icons.list_rounded, 0),
          label: "Posts",
        ),
        BottomNavigationBarItem(
          icon: determineIconState(Icons.drafts, 1),
          label: "Drafts",
        ),
        //$ Will be coming soon
        // BottomNavigationBarItem(
        //   icon: determineIconState(Icons.query_stats, 2),
        //   label: "Query Stats",
        // ),
        BottomNavigationBarItem(
          icon: determineIconState(Icons.settings_outlined, 3),
          label: "Settings",
        ),
      ],
    );
  }
}
