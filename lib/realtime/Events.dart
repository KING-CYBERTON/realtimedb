import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final int index;
  const EventCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        
        width:double.infinity,
        
        height: 200,
        decoration: BoxDecoration(
          boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      color: Color.fromARGB(255, 12, 194, 82),
                    )
                  ],
                  border: Border.all(
                    color: Color.fromARGB(255, 60, 206, 16),
                    width: 2,
                  ),
         
          image: const DecorationImage(image:  AssetImage(
                  'images/splash.jpg',
                ),
                  fit: BoxFit.fitWidth,
          ),
                
            borderRadius: BorderRadius.circular(16.0), color: Colors.white),
            
        child: SizedBox(
          height: 90,
          child: Column(
            
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                color: Colors.white10.withOpacity(0.6),
                child: Column(
                  children: [
                       Text('Title', style:TextStyle(color: Colors.black) ,),
                    
              Text('Captions', style:TextStyle(color: Colors.black)),
                  ],

                ),
              ),
            //limit length to 200 characters

          ]),
        ) ,
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                index: index,
              );
            });
  }
}
