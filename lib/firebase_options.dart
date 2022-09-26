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
    apiKey: 'AIzaSyCoJLD8gOdGl7PztplOkCcUYgmBGITdTrQ',
    appId: '1:246251264401:web:d8eff7dc02c4d14e57a230',
    messagingSenderId: '246251264401',
    projectId: 'cashcollect-app',
    authDomain: 'cashcollect-app.firebaseapp.com',
    storageBucket: 'cashcollect-app.appspot.com',
    measurementId: 'G-6VP6126YE1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIE_5vYf8ZIaOrYXB0C88b4U5pc99_8mQ',
    appId: '1:246251264401:android:7c0dd82f3ccc4f6c57a230',
    messagingSenderId: '246251264401',
    projectId: 'cashcollect-app',
    storageBucket: 'cashcollect-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByL5cvO9gWp3VCbebV3ufihpQlRopxqkw',
    appId: '1:246251264401:ios:bfc2a8e34664d96a57a230',
    messagingSenderId: '246251264401',
    projectId: 'cashcollect-app',
    storageBucket: 'cashcollect-app.appspot.com',
    iosClientId: '246251264401-48khp2s0nc6mtg04kh1bcd7rmptcldv0.apps.googleusercontent.com',
    iosBundleId: 'sahelfund.cashcollect.app.cashcollect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByL5cvO9gWp3VCbebV3ufihpQlRopxqkw',
    appId: '1:246251264401:ios:bfc2a8e34664d96a57a230',
    messagingSenderId: '246251264401',
    projectId: 'cashcollect-app',
    storageBucket: 'cashcollect-app.appspot.com',
    iosClientId: '246251264401-48khp2s0nc6mtg04kh1bcd7rmptcldv0.apps.googleusercontent.com',
    iosBundleId: 'sahelfund.cashcollect.app.cashcollect',
  );
}