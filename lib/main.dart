import 'package:flutter/material.dart';

final primaryColor = Colors.blue.shade400;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        margin: const EdgeInsets.only(bottom: 5),
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
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Name"),
        actions: const [
          Icon(Icons.account_circle_outlined),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 325,
                height: 350,
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/mobile_bro.png",
                      width: 225,
                      height: 225,
                      fit: BoxFit.contain,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet consectetur. Ornare sit enim vitae ullamcorper.",
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          fixedSize: const Size(300, 15)),
                      child: const Text("Upload your first shot"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {},
        tooltip: 'Add Item',
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, size: 50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: changePage,
        iconSize: 35,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(color: Colors.blue),
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
      ),
    );
  }
}

// drafts
// query_stats
// settings_outlined