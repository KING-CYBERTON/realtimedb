import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

String dropdownValue = 'Select';

class _AddPostState extends State<AddPost> {
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

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 3,
                      ),
                    ),
                    child: const TextField(),
                  ),
                  //should be a list of selected photos
                  Image.asset('images/splash.jpg'),

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
                  ElevatedButton(onPressed: () {}, child: const Text('Publish'))
                ]),
          ),
        ),
      ),
    );
  }
}
