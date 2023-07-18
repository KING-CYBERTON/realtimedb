import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: [
          IconButton(onPressed: (){}, icon:const Icon(
            Icons.post_add_rounded,
            color: Colors.green,
          ))
        ],
        
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  
                 backgroundImage: AssetImage('images/logo.png'),
                ),
                Spacer(),
                Container(
                  color: Colors.white70,
                  width: 20,
                  // child:DropdownMenu(
                  // width: 20,
                  // dropdownMenuEntries: []),
                )
                
               
              ],
              ),
              Container(
                child: TextField(),
              ),
              //should be a list of selected photos
              Container(
                child: Image.asset('assets/images/logo.png'),
              ),
              
              
              
          
          ],
        ),
      ),
    );
  }
}