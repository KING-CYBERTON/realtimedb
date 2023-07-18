import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          //List builder for events
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.greenAccent,
                  width: 3,
                )),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text('Forum'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text('Events'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
