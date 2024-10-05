import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/home_nav_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart';
import 'package:untitled_app/utils/snack_utils.dart';

class DrawerTab extends ConsumerWidget {
  const DrawerTab({
    super.key,
    required this.title,
    required this.icon,
    required this.appPath,
    this.subTitle,
  });

  final String title;
  final IconData icon;
  final String appPath;
  final String? subTitle;

  void navigateToCalendar(
      BuildContext _, Future<void> Function() logout, WidgetRef ref) async {
    if (appPath == '/profile') {
      ref.read(homeNavProvider.notifier).state = 2;
      Navigator.pop(_);
      return;
    }

    if (appPath == '/log-out') {
      Navigator.popAndPushNamed(_, Routes.signUpString);
      await logout();
      if (_.mounted) showSnackBarSuccessMessage(_, "Logged out successfully!");
    } else {
      Navigator.popAndPushNamed(_, appPath);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(userProvider.notifier).signOut;
    return GestureDetector(
      onTap: () {
        navigateToCalendar(context, logout, ref);
      },
      child: Container(
        padding: subTitle == null
            ? const EdgeInsets.only(top: 8, bottom: 8)
            : const EdgeInsets.only(top: 8, bottom: 23),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color.fromRGBO(0, 92, 184, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  if (subTitle != null) ...[
                    const SizedBox(height: 6),
                    Text(subTitle!,
                        style: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.5))),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
