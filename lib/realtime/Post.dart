import 'package:flutter/material.dart';

import 'event_model.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    
    if (Post.posts[index].photo == null) {
      return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.greenAccent,
          width: 3,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/splash.jpg'),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Text(Post.posts[index].captions),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    } else {
        return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.greenAccent,
          width: 3,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/splash.jpg'),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Text(Post.posts[index].captions),
                ),
                Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            Post.posts[index].photo!,
                          )),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
    }
  
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Post.posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(
            index: index,
          );
        });
  }
}
