import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kDebugMode, kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
          'DefaultFirebaseOptions are not supported for this platform.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    appId: dotenv.env['FIREBASE_APP_ID']!,
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    appId: dotenv.env['FIREBASE_APP_ID']!,
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    appId: dotenv.env['FIREBASE_APP_ID']!,
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    appId: dotenv.env['FIREBASE_APP_ID']!,
  );

  static final FirebaseOptions windows = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    appId: dotenv.env['FIREBASE_APP_ID']!,
  );
}
