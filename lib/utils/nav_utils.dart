import 'package:flutter/material.dart';
import 'package:untitled_app/pages/confirmation_page.dart';
import 'package:untitled_app/pages/create_post.dart';
import 'package:untitled_app/pages/home_page.dart';
import 'package:untitled_app/pages/link_page.dart';
import 'package:untitled_app/pages/login_page.dart';
import 'package:untitled_app/pages/phone_login.dart';
import 'package:untitled_app/pages/phone_signup.dart';
import 'package:untitled_app/pages/request_social.dart';
import 'package:untitled_app/pages/sign_up.dart';
import 'package:untitled_app/pages/splash_page.dart';

enum Route {
  splash(route: "/"),
  home(route: "/home"),
  signUp(route: "/sign-up"),
  phoneSignUp(route: "/phone-sign-up"),
  phoneLogIn(route: "/phone-login"),
  logIn(route: "/log-in"),
  link(route: "/link"),
  createPost(route: "/create-post"),
  calendar(route: "/calendar"),
  postHistory(route: "/post-history"),
  profile(route: "/profile"),
  support(route: "/support"),
  requestSocial(route: "/request-social");

  const Route({required this.route});
  final String route;

  static WidgetBuilder get splashRoute => (_) => const SplashScreen();
  static WidgetBuilder get homeRoute => (_) => const HomePage();
  static WidgetBuilder get signUpRoute => (_) => const SignUpPage();
  static WidgetBuilder get phoneSignUpRoute => (_) => const PhoneSignUp();
  static WidgetBuilder get phoneLogInRoute => (_) => const PhoneLogInPage();
  static WidgetBuilder get logInRoute => (_) => const LogInPage();
  static WidgetBuilder get linkRoute => (_) => const LinkPage();
  static WidgetBuilder get createPostRoute => (_) => const CreatePostPage();
  static WidgetBuilder get calendarRoute => (_) => const HomePage();
  static WidgetBuilder get postHistoryRoute => (_) => const HomePage();
  static WidgetBuilder get profileRoute => (_) => const HomePage();
  static WidgetBuilder get supportRoute => (_) => const HomePage();
  static WidgetBuilder get requestSocialRoute => (_) => const RequestSocial();
  static MaterialPageRoute get successfulSocialRequest => MaterialPageRoute(
        builder: (_) => const ConfirmationPage(
            detailMessage:
                'Your request for adding a new social media\nplatform is successfully sent and will be\nreviewed shortly.',
            titleMessage: 'Congratulations!'),
      );
  static MaterialPageRoute get failedRequest => MaterialPageRoute(
        builder: (_) => const ConfirmationPage(
            detailMessage: 'Your request could not be completed at this time.',
            titleMessage: 'Error!'),
      );
  static MaterialPageRoute get successfulSignUp => MaterialPageRoute(
        builder: (_) => const ConfirmationPage(
          titleMessage: "Congratulations!",
          detailMessage: "You have officially signed up for CrossMedia!",
        ),
      );

  // TODO Document Strings and Route Functions
  static String get splashString => splash.route;
  static String get homeString => home.route;
  static String get signUpString => signUp.route;
  static String get phoneSignUpString => phoneSignUp.route;
  static String get phoneLogInString => phoneLogIn.route;
  static String get logInString => logIn.route;
  static String get linkString => link.route;
  static String get createPostString => createPost.route;
  static String get calendarString => calendar.route;
  static String get postHistoryString => postHistory.route;
  static String get profileString => profile.route;
  static String get supportString => support.route;
  static String get requestSocialString => requestSocial.route;
}

final routes = {
  Route.splashString: Route.splashRoute,
  Route.homeString: Route.homeRoute,
  Route.signUpString: Route.signUpRoute,
  Route.phoneSignUpString: Route.phoneSignUpRoute,
  Route.phoneLogInString: Route.phoneLogInRoute,
  Route.logInString: Route.logInRoute,
  Route.linkString: Route.linkRoute,
  Route.createPostString: Route.createPostRoute,
  Route.calendarString: Route.calendarRoute,
  Route.postHistoryString: Route.postHistoryRoute,
  Route.profileString: Route.profileRoute,
  Route.supportString: Route.supportRoute,
  Route.requestSocialString: Route.requestSocialRoute,
};
