import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/realtime/events.dart';
import 'package:realtimedb/realtime/Post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFeedButton = false;
  bool showEventsButton = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.greenAccent.withOpacity(0.5),
              width: 300,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/splash.jpg'),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white10,
                width: 300,
                child: Stack(
                  children: [
                    selectedIndex == 0 ? const PostList() : const EventList(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            Get.toNamed('/AddPost');
                          },
                          tooltip: 'Post',
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyBottomNavigationBar(
              selectedIndex: selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const MyBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      height: 70,
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
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onIndexChanged(0),
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth:
                        150), // Limit width to half of the available space
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: selectedIndex == 0
                          ? Colors.greenAccent.withOpacity(0.5)
                          : Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: selectedIndex == 0
                        ? Colors.greenAccent
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: const Center(
                  child: Text('Forum'),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onIndexChanged(1),
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth:
                        150), // Limit width to half of the available space
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: selectedIndex == 1
                          ? Colors.greenAccent.withOpacity(0.5)
                          : Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: selectedIndex == 1
                        ? Colors.greenAccent
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: const Center(
                  child: Text('Events'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
