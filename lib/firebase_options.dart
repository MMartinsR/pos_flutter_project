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
    apiKey: 'AIzaSyBH42LD8M8-OnAet5-UR_NgmkRcsqb5VgQ',
    appId: '1:21641553811:web:6c77820a2afb148855aa66',
    messagingSenderId: '21641553811',
    projectId: 'autocontrolpanel',
    authDomain: 'autocontrolpanel.firebaseapp.com',
    storageBucket: 'autocontrolpanel.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_IpKTPYjzggQFtguuKfiA7eJrBYJhMEk',
    appId: '1:21641553811:android:aced0ffc5a17d8fc55aa66',
    messagingSenderId: '21641553811',
    projectId: 'autocontrolpanel',
    storageBucket: 'autocontrolpanel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8_xrxKkSCgQlDuO78ToiEY1BQRu2omT8',
    appId: '1:21641553811:ios:2c3ab5bd92ed439755aa66',
    messagingSenderId: '21641553811',
    projectId: 'autocontrolpanel',
    storageBucket: 'autocontrolpanel.appspot.com',
    iosBundleId: 'br.flutter.pos.martins.posFlutterProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8_xrxKkSCgQlDuO78ToiEY1BQRu2omT8',
    appId: '1:21641553811:ios:0b9446ff3bf93c5255aa66',
    messagingSenderId: '21641553811',
    projectId: 'autocontrolpanel',
    storageBucket: 'autocontrolpanel.appspot.com',
    iosBundleId: 'com.example.posFlutterProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBH42LD8M8-OnAet5-UR_NgmkRcsqb5VgQ',
    appId: '1:21641553811:web:6ae428664d82470855aa66',
    messagingSenderId: '21641553811',
    projectId: 'autocontrolpanel',
    authDomain: 'autocontrolpanel.firebaseapp.com',
    storageBucket: 'autocontrolpanel.appspot.com',
  );
}