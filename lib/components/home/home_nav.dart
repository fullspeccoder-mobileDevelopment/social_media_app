import 'package:flutter/material.dart';

/// Bottom navigation bar for the home screen
///
/// Will allow the user to move between a few pages within the application.
class BottomHomeNavbar extends StatefulWidget {
  const BottomHomeNavbar({super.key});

  @override
  State<BottomHomeNavbar> createState() => _BottomHomeNavbarState();
}

class _BottomHomeNavbarState extends State<BottomHomeNavbar> {
  int currentPage = 0;

  void changePage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  Widget determineIconState(IconData iconData, int index) {
    if (currentPage == index) {
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
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: changePage,
      iconSize: 35,
      showUnselectedLabels: false,
      fixedColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue.shade100,
      items: [
        BottomNavigationBarItem(
          icon: determineIconState(Icons.list_rounded, 0),
          label: "Posts",
        ),
        BottomNavigationBarItem(
          icon: determineIconState(Icons.drafts, 1),
          label: "Drafts",
        ),
        BottomNavigationBarItem(
          icon: determineIconState(Icons.query_stats, 2),
          label: "Query Stats",
        ),
        BottomNavigationBarItem(
          icon: determineIconState(Icons.settings_outlined, 3),
          label: "Settings",
        ),
      ],
    );
  }
}
