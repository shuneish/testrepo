import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyAxisH_e_x-iRrKwZQ9L_sCxISUirXhNDc",
    appId: "1:411201713180:android:18cff192225ef1268f1bd9",
    messagingSenderId: "411201713180",
    projectId: "shunei-awa-658c7",
    storageBucket: "shunei-awa-658c7.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyAxisH_e_x-iRrKwZQ9L_sCxISUirXhNDc",
    appId: "1:411201713180:ios:ad1fd5a1f886baa38f1bd9",
    messagingSenderId: "411201713180",
    projectId: "shunei-awa-658c7",
    storageBucket: "shunei-awa-658c7.appspot.com",
    iosBundleId: "com.example.test",
  );
}
