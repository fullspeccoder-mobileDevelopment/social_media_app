import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/drawer/tab.dart';
import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/providers/user_provider.dart';

/// The app drawer that contains all of the settings information
///
/// This will eventually allow the user to check their profile and change settings
/// This will also allow the user to schedule posts, review their post history and be able to contact help & support if necessary
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key, required this.currentUser});

  final FirebaseUser currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: const Alignment(-1, 0.5),
              child: const Text("My Menu", style: TextStyle(fontSize: 32)),
            ),
            const SizedBox(height: 35),
            Container(
              child: const Column(
                children: [
                  DrawerTab(
                    title: "Calendar",
                    subTitle: "Schedule your posts",
                    icon: Icons.calendar_month_outlined,
                    appPath: '/calendar',
                  ),
                  DrawerTab(
                    icon: Icons.access_time_outlined,
                    title: "Post history",
                    subTitle: "Review post history",
                    appPath: '/post-history',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 175.0,
                    ),
                    child: Text(
                      "Accounts",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  DrawerTab(
                    title: user.username,
                    subTitle: "Profile",
                    icon: Icons.account_circle,
                    appPath: '/profile',
                  ),
                  const DrawerTab(
                    title: "Add new account",
                    icon: Icons.add,
                    appPath: '/log-in',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 225.0,
                    ),
                    child: Text(
                      "More",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  DrawerTab(
                    title: "Help & Support",
                    icon: Icons.help,
                    appPath: '/support',
                  ),
                  DrawerTab(
                    title: "Logout",
                    icon: Icons.logout,
                    appPath: '/log-out',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
