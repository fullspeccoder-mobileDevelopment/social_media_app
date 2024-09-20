// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyClqxIdG0A2_zREn5y6R23EWmXDYzhDv7U',
    appId: '1:1095066264952:web:a277e4cda42b2aec2b948d',
    messagingSenderId: '1095066264952',
    projectId: 'cross-media-app',
    authDomain: 'cross-media-app.firebaseapp.com',
    storageBucket: 'cross-media-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMt3O297qNFV2zk6cdJkRpH7GwDEDSEGc',
    appId: '1:1095066264952:android:bf533c9cd73632932b948d',
    messagingSenderId: '1095066264952',
    projectId: 'cross-media-app',
    storageBucket: 'cross-media-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArJ44CZiXjplkb30LgNHbi-KGBlBQ7mf4',
    appId: '1:1095066264952:ios:e0e0af39d1d6b7be2b948d',
    messagingSenderId: '1095066264952',
    projectId: 'cross-media-app',
    storageBucket: 'cross-media-app.appspot.com',
    androidClientId: '1095066264952-g6p1pjc1p7j5regrsrnp2htflbb9tp8e.apps.googleusercontent.com',
    iosClientId: '1095066264952-uhl8n48ulah4sspr630cpt4vag789iio.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitledApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArJ44CZiXjplkb30LgNHbi-KGBlBQ7mf4',
    appId: '1:1095066264952:ios:e0e0af39d1d6b7be2b948d',
    messagingSenderId: '1095066264952',
    projectId: 'cross-media-app',
    storageBucket: 'cross-media-app.appspot.com',
    androidClientId: '1095066264952-g6p1pjc1p7j5regrsrnp2htflbb9tp8e.apps.googleusercontent.com',
    iosClientId: '1095066264952-uhl8n48ulah4sspr630cpt4vag789iio.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitledApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyClqxIdG0A2_zREn5y6R23EWmXDYzhDv7U',
    appId: '1:1095066264952:web:8d152a4c1b33ca6a2b948d',
    messagingSenderId: '1095066264952',
    projectId: 'cross-media-app',
    authDomain: 'cross-media-app.firebaseapp.com',
    storageBucket: 'cross-media-app.appspot.com',
  );

}