import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/controller/realtime_coontoller.dart';

import 'add_post.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBSzL-jgsMsuv7xbqwLqZQ7Q0N4ENQzgPc",
        projectId: "test-f8da9",
        storageBucket: "test-f8da9.appspot.com",
        databaseURL: "https://test-f8da9-default-rtdb.firebaseio.com",
        messagingSenderId: "221472767325",
        appId: "1:221472767325:web:e4052c592d2910a9577cb4",
      ),
    ).then((value) => Get.put(Realtime()));
    runApp(const MyApp());
  } else {
    await Firebase.initializeApp().then((value) => Get.put(Realtime()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tree Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      getPages: [
        GetPage(name: '/AddPost', page: () => const AddPost()),
      ],
      home: const HomePage(),
    );
  }
}
