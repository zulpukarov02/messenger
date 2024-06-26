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
    apiKey: 'AIzaSyBhyCsk7dCEVDigjlm_5A7-wKg0oVYaGi4',
    appId: '1:478598674384:web:cb938efb3d84c98c4debd5',
    messagingSenderId: '478598674384',
    projectId: 'messanger-128b9',
    authDomain: 'messanger-128b9.firebaseapp.com',
    storageBucket: 'messanger-128b9.appspot.com',
    measurementId: 'G-8R3XY66XNY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLrArHApDGUSiQwAu8o-TcsaB0Rl-_Y40',
    appId: '1:478598674384:android:457d81c7fa7442e14debd5',
    messagingSenderId: '478598674384',
    projectId: 'messanger-128b9',
    storageBucket: 'messanger-128b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnzCIO6Zj_1TUDbZhlCLdYcnOdmj18DKs',
    appId: '1:478598674384:ios:f1ea51e17034344c4debd5',
    messagingSenderId: '478598674384',
    projectId: 'messanger-128b9',
    storageBucket: 'messanger-128b9.appspot.com',
    iosBundleId: 'com.example.messenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnzCIO6Zj_1TUDbZhlCLdYcnOdmj18DKs',
    appId: '1:478598674384:ios:eadc3583b75142ef4debd5',
    messagingSenderId: '478598674384',
    projectId: 'messanger-128b9',
    storageBucket: 'messanger-128b9.appspot.com',
    iosBundleId: 'com.example.messenger.RunnerTests',
  );
}
