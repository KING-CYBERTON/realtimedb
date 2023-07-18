import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: 300,
        
       
        decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(16.0), color: Colors.white),
        child: Row(
          children: [
             Container(
                child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/splash.jpg'),
                  )
                ],
              ),
            )),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child:Text('kimani the genius dbfiibwibfiwebfiebfiebfwiebfiwebfwiebfwibweuwefuweuifbwuebfwuefwuefuwbefuiwefubefbwefbwuebuwbuwbuiwebuwbeueuibwuief'), 
                  ),
                  
                  Container(
                    width: 300,
                    height: 200,
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                    'images/splash.jpg',
                      )
                      
                    ),
                    
                    
                   
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return 
         ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return PostCard(
                index: index,
              );
            });
  }
}
