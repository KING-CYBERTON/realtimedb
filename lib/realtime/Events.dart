import 'package:flutter/material.dart';
import 'event_model.dart';

class EventCard extends StatelessWidget {
  final int index;
  const EventCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: double.infinity,
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
              color: const Color.fromARGB(255, 60, 206, 16),
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage(
                Event.events[index].eventimage,
              ),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white),
        child: SizedBox(
          height: 90,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              color: Colors.white10.withOpacity(0.6),
              child: Column(
                children: [
                  Text(
                    Event.events[index].eventdetails,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(Event.events[index].eventtitle,
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Event.events.length,
        itemBuilder: (BuildContext context, int index) {
          return EventCard(
            index: index,
          );
        });
  }
}
