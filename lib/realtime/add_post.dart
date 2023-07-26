import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/realtime/CustomText.dart';
import 'package:realtimedb/realtime/event_model.dart';

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
      appBar: AppBar(
        title: const Text('Adding post'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.post_add_rounded,
                color: Color.fromARGB(255, 7, 7, 7),
              ))
        ],
      ),
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
                        backgroundImage: AssetImage('images/splash.jpg'),
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
                    : Image.asset('images/Splash.jpg'),

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
                        if (photo != null && photo.isNotEmpty) {
                           controller.addPost(userid, photo, captions);
                        } else {
                          controller.addPost2(userid,captions);
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
