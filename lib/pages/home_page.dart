import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/drawer/drawer.dart';
import 'package:untitled_app/components/home/home_button.dart';
import 'package:untitled_app/components/home/home_content.dart';
import 'package:untitled_app/components/home/home_nav.dart';
import 'package:untitled_app/providers/home_nav_provider.dart';
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
    final homeIndex = ref.watch(homeNavProvider);

    return Scaffold(
      appBar: homeIndex != 2
          ? AppBar(
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
                  IconButton(
                    onPressed: null,
                    icon: Image.asset(
                      'assets/images/avatar.png',
                      width: 25,
                      height: 25,
                    ),
                  )
                ],
              ),
            )
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  ref.read(homeNavProvider.notifier).state = 0;
                },
              ),
              title: const Text("Settings"),
            ),
      drawer: AppDrawer(currentUser: currentUser),
      body: const HomeContent(),
      floatingActionButton: homeIndex != 2 ? const HomeButton() : null,
      bottomNavigationBar: homeIndex != 2 ? const BottomHomeNavbar() : null,
    );
  }
}
