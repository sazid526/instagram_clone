import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/app.dart';
import 'package:instagram_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCMpML6ZgaWdJLMsdfeuLiGYfYLTMzqSAo",
        appId: "1:1002979047857:web:b95d1feca5a398900c6590",
        messagingSenderId: "1002979047857",
        projectId: "instagram-clone-b37ba",
        storageBucket: "instagram-clone-b37ba.appspot.com",
      ),
    );
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const InstagramClone());
}
