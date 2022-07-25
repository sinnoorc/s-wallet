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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU6oGroQdZYz-LCxyjVgqUClYHYanToB8',
    appId: '1:32487786006:android:d5e692b4483dd890af1737',
    messagingSenderId: '32487786006',
    projectId: 'fir-wallet-10642',
    storageBucket: 'fir-wallet-10642.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAD9f1wOQnjDeoA1Hq-oESMKI2F39WhQxw',
    appId: '1:32487786006:ios:584112fb5db7ad50af1737',
    messagingSenderId: '32487786006',
    projectId: 'fir-wallet-10642',
    storageBucket: 'fir-wallet-10642.appspot.com',
    iosClientId: '32487786006-rfir7pho5ufi3u1lls048u8ftfbsdjqf.apps.googleusercontent.com',
    iosBundleId: 'dev.sinnoor.swallet',
  );
}