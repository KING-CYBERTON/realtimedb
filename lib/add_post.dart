import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CustomText.dart';
import 'controller/realtime_coontoller.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

String dropdownValue = 'Select';

class _AddPostState extends State<AddPost> {
  final Realtime controller = Get.find();
  final captioncontroller = TextEditingController();
  String userid = 'kimani';

  late String photo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.greenAccent,
              width: 3,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person)),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/splash.jpg'),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.logout))
                    ],
                  ),
                  CustomText(
                      isPass: false,
                      hintText: 'Enter captions',
                      textInputType: TextInputType.text,
                      textController: captioncontroller),

                  //should be a list of selected photos
                  photo.isNotEmpty
                      ? Image.network(photo)
                      : Image.asset('assets/images/Splash.jpg'),

                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Select', 'Post', 'Event']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String captions = captioncontroller.text.trim();

                        if (captions.isNotEmpty) {
                          if (photo != null && photo.isNotEmpty) {
                            controller.addPost(userid, photo, captions);
                          } else {
                            controller.addPost2(userid, captions);
                          }
                        } else {
                          Get.snackbar(
                            'Error',
                            'Please add a caption',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.redAccent.withOpacity(0.2),
                            colorText: Colors.black,
                          );
                        }
                      },
                      child: const Text('Publish'))
                ]),
          ),
        ),
      ),
    );
  }
}
