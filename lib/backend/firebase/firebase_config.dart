import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAZBZKzgGVkN30IKCPJLqPGR_sdnW0y5w4",
            authDomain: "beauty-booking-alekszaru.firebaseapp.com",
            projectId: "beauty-booking-alekszaru",
            storageBucket: "beauty-booking-alekszaru.appspot.com",
            messagingSenderId: "266149373120",
            appId: "1:266149373120:web:051e5718c45b02d50f7925"));
  } else {
    await Firebase.initializeApp();
  }
}
