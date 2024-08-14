import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/user.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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

  Widget _drawer(LocalUser currentUser) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 12, right: 12),
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Image(
                            image: NetworkImage(
                                "https://www.w3schools.com/w3images/avatar2.png")),
                      ),
                      Text(currentUser.email),
                    ],
                  ),
                  useGreyDivider(),
                  Container(
                    child: const Column(
                      children: [
                        TextButton(
                          child: const Text("Page # 1"),
                          onPressed: null,
                        ),
                        TextButton(
                          child: const Text("Page # 2"),
                          onPressed: null,
                        ),
                        TextButton(
                          child: const Text("Page # 3"),
                          onPressed: null,
                        ),
                        TextButton(
                          child: const Text("Page # 4"),
                          onPressed: null,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _endDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text("Drawer will be here"),
            ),
          ),
        ],
      ),
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
    final currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser.email),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.circle_outlined),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          })
        ],
      ),
      drawer: _drawer(currentUser),
      endDrawer: _endDrawer(),
      body: _mainContent(),
      floatingActionButton: _callToActionButton(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}
