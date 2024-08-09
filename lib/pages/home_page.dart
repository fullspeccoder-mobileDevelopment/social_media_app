import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  Widget _mainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 400,
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/mobile_bro.png",
                    width: 300,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet consectetur. Ornare sit enim vitae ullamcorper.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(106, 106, 106, 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      backgroundColor: Colors.blue.shade900,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(375, 50),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text("Upload your first shot"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  FloatingActionButton _callToActionButton() {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.blue.shade400,
      foregroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Add Item',
      shape: const CircleBorder(),
      child: const Icon(Icons.add_rounded, size: 50),
    );
  }

  BottomNavigationBar _bottomNavBar() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/log-in");
              },
            ),
            const Text("Name"),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/sign-up");
              },
            )
          ],
        ),
      ),
      body: _mainContent(),
      floatingActionButton: _callToActionButton(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}
