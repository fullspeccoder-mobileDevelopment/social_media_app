import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/drawer/drawer.dart';
import 'package:untitled_app/components/home/home_button.dart';
import 'package:untitled_app/components/home/home_content.dart';
import 'package:untitled_app/components/home/home_nav.dart';
import 'package:untitled_app/providers/user_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userProvider).user;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              }),
              Text(currentUser.username.isNotEmpty
                  ? currentUser.username
                  : currentUser.email),
              const IconButton(
                  onPressed: null, icon: Icon(Icons.panorama_fish_eye_outlined))
            ],
          )),
      drawer: AppDrawer(currentUser: currentUser),
      body: const HomeContent(),
      floatingActionButton: const HomeButton(),
      bottomNavigationBar: const BottomHomeNavbar(),
    );
  }
}
