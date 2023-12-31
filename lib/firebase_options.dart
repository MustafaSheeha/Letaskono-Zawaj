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
    apiKey: 'AIzaSyBPyIfpwHdB24nkPiVBAmnCFxad78s6p38',
    appId: '1:722145384288:web:4daa9269d73c4b154d7005',
    messagingSenderId: '722145384288',
    projectId: 'letaskono-zawaj',
    authDomain: 'letaskono-zawaj.firebaseapp.com',
    storageBucket: 'letaskono-zawaj.appspot.com',
    measurementId: 'G-SWCHQQMSRL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPBDj9CLg4NzEKdsywXqzKq4XOeom2iqU',
    appId: '1:722145384288:android:c385f3925fed3a1f4d7005',
    messagingSenderId: '722145384288',
    projectId: 'letaskono-zawaj',
    storageBucket: 'letaskono-zawaj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDphn7w0Sse9LczLgvMucPAnRMmKKGYBE0',
    appId: '1:722145384288:ios:f2205ee40b4ebaad4d7005',
    messagingSenderId: '722145384288',
    projectId: 'letaskono-zawaj',
    storageBucket: 'letaskono-zawaj.appspot.com',
    iosBundleId: 'com.example.letaskonoZawaj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDphn7w0Sse9LczLgvMucPAnRMmKKGYBE0',
    appId: '1:722145384288:ios:96346699cebcdab24d7005',
    messagingSenderId: '722145384288',
    projectId: 'letaskono-zawaj',
    storageBucket: 'letaskono-zawaj.appspot.com',
    iosBundleId: 'com.example.letaskonoZawaj.RunnerTests',
  );
}
