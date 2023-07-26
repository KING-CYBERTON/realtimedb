import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../event_model.dart';

class Realtime extends GetxController {
  static Realtime instance = Get.find();
  final DatabaseReference _database = FirebaseDatabase.instance.ref();


    void addPost2(String userId, String captions) async {
    try {
        Map<String, dynamic> postData = {
          
        'userid': userId,
        'captions': captions,
      };
      await _database.child('posts').push().set(postData).then((_) {
        Get.snackbar(
          'Success',
          'Info has been updated',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
          colorText: Colors.black87,
        );
      }).catchError((e) {
        Get.snackbar(
          'Error',
          'Something went wrong',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.black,
        );
      });
    } catch (e) {
      print('Error adding post: $e');
    }
  }

  void addPost(String userId, String photo, String captions) async {
    try {
        Map<String, dynamic> postData = {
          
        'userid': userId,
        'captions': captions,
        'photo': photo,
      };
      await _database.child('posts').push().set(postData).then((_) {
        Get.snackbar(
          'Success',
          'Info has been updated',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
          colorText: Colors.black87,
        );
      }).catchError((e) {
        Get.snackbar(
          'Error',
          'Something went wrong',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.black,
        );
      });
    } catch (e) {
      print('Error adding post: $e');
    }
  }


}
