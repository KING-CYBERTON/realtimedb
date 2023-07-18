import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/realtime/homepage.dart';
import 'package:realtimedb/realtime/add_post.dart';

void main() async {
  runApp(const MyApp());
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
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/AddPost', page: () => const AddPost()),
      ],
      initialRoute: '/',
 
    );
  }
}


