import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/home/drawer.dart';
import 'package:untitled_app/components/home/end_drawer.dart';
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
      drawer: AppDrawer(currentUser: currentUser),
      endDrawer: const EndDrawer(),
      body: const HomeContent(),
      floatingActionButton: const HomeButton(),
      bottomNavigationBar: const BottomHomeNavbar(),
    );
  }
}
