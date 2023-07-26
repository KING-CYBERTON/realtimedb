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
        apiKey: "AIzaSyAmOB_-8DIEIwJEOvrM2a8C6RE-KbvSDDc",
        projectId: "educative-9",
        storageBucket: "educative-9.appspot.com",
         databaseURL: "https://educative-9-default-rtdb.firebaseio.com",
        messagingSenderId: "14205101883",
        appId:"1:14205101883:web:7c0db5d88bc2dc0310791e",
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
