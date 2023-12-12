import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/controller/realtime_coontoller.dart';

import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "{{API_Key}}",
        projectId: "{{projectId}}",
        storageBucket: "{{storageBucket}}",
        databaseURL: "{{databaseURL}}",
        messagingSenderId: "{{messagingSenderId}}",
        appId: "{{appId}}",
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
        //add pages here
      ],
      home: const HomePage(),
    );
  }
}
