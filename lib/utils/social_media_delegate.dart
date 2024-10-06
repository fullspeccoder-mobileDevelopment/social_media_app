import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/user_provider.dart';

/// Class used to delegate the social media posts, which card to link a profile is made for which authentication method, etc..
///
/// [codeName] - the codeName of the social media for card; [ref] - the widget's reference to call the userProvider's notifier
abstract class SocialMediaDelegate {
  static Future<void> Function()? provideAuthFunction(
      String codeName, WidgetRef ref) {
    final notifier = ref.read(userProvider.notifier);
    switch (codeName) {
      case "twitter":
        return notifier.logInWithTwitter;
      case "linkedin":
        return () async {};
      case "instagram":
        return () async {};
      case "snapchat":
        return () async {};
      case "facebook":
        return () async {};
      default:
        print("Social not applicable");
        return null;
    }
  }

  // static Future<void>
}
