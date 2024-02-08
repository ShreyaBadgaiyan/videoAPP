// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC9B2hey0ZTeud-mkvAQ71549m-WeOtAos',
    appId: '1:465075655646:web:f3a9d334871442cbb3034f',
    messagingSenderId: '465075655646',
    projectId: 'videoapp-4b999',
    authDomain: 'videoapp-4b999.firebaseapp.com',
    storageBucket: 'videoapp-4b999.appspot.com',
    measurementId: 'G-7WLZSCC5DD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7P09N_Ulgg6JbOmcJdG9veIUfgg9bDgk',
    appId: '1:465075655646:android:0ba0904231719bd3b3034f',
    messagingSenderId: '465075655646',
    projectId: 'videoapp-4b999',
    storageBucket: 'videoapp-4b999.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0RaQ7t5MaqLaiM23M9x1gHqdNA6tRKPY',
    appId: '1:465075655646:ios:279fe46c7e849152b3034f',
    messagingSenderId: '465075655646',
    projectId: 'videoapp-4b999',
    storageBucket: 'videoapp-4b999.appspot.com',
    iosBundleId: 'com.example.videoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0RaQ7t5MaqLaiM23M9x1gHqdNA6tRKPY',
    appId: '1:465075655646:ios:0a2163069c7887bab3034f',
    messagingSenderId: '465075655646',
    projectId: 'videoapp-4b999',
    storageBucket: 'videoapp-4b999.appspot.com',
    iosBundleId: 'com.example.videoapp.RunnerTests',
  );
}