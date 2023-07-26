
In this lesson we are going to provide an overview of the `HomePage` widget in our Flutter application. The `HomePage` widget is responsible for rendering the main screen of the crud application, which includes a top and bottom navigation bar  section, and a content area displaying either posts or events.

## Class Structure

We will implemented the `Homepage` as a `StatefulWidget` and has a corresponding state that manages its internal state.The widget imports the following packages and files:
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtimedb/realtime/events.dart';
import 'package:realtimedb/realtime/Post.dart';
```

- `flutter/material.dart`: Provides Flutter's Material Design widgets for UI components.
- `get/get.dart`: Imports the Get library for navigation and state management.
- `realtimedb/realtime/events.dart`: Imports a file containing the `EventList` widget.
- `realtimedb/realtime/Post.dart`: Imports a file containing the `PostList` widget.

### Widget Declaration

The `HomePage` widget is defined as follows:
```dart
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
```

- The `HomePage` class extends `StatefulWidget`, indicating that it has mutable state.
- The `HomePage` constructor takes an optional `Key` parameter.
- The `createState()` method returns an instance of the `_HomePageState` class, which manages the widget's state.


### State Properties

The state class defines the following properties:
```dart
int selectedIndex = 0;
```

- `selectedIndex`: An integer representing the index of the currently selected tab in the navigation bar.

### Widget Build
We willl build the widget as shown in the code below

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    // Scaffold widget provides a basic layout structure for the screen.
    body: Center(
      // Center widget horizontally and vertically centers its child.
      child: Column(
        // Column widget arranges its children in a vertical column.
        children: [
          // Top Navigation Bar
          Container(
            // Container widget represents a rectangular visual element.
            color: Colors.greenAccent.withOpacity(0.5),
            width: 300,
            child: Row(
              // Row widget arranges its children in a horizontal row.
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/splash.jpg'),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          Expanded(
            // Expanded widget takes up remaining space vertically.
            child: Container(
              color: Colors.white10,
              width: 300,
              child: Stack(
                // Stack widget overlays its children.
                children: [
                  // Content area (PostList or EventList)
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
          // Bottom navigation bar
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
```

- The `build()` method returns a `Scaffold` widget, which provides a basic screen layout structure.
- Inside the `Scaffold`, the content is arranged using `Center`, `Column`, and `Expanded` widgets.
- The top navigation section is represented by a colored `Container` with a `Row` containing user profile icons.
- The content area is represented by a `Container` with a `Stack` that displays either `PostList` or `EventList` based on the `selectedIndex`.
- An "Add" floating action button is displayed at the bottom-right corner of the screen.
- Finally, the `MyBottomNavigationBar` widget is used for the bottom navigation bar.

## MyBottomNavigationBar Widget

The `MyBottomNavigationBar` widget represents a custom bottom navigation bar used in the `HomePage` widget.

### Widget Properties

The `MyBottomNavigationBar` widget has the following properties:
```dart
final int selectedIndex;
final Function(int) onIndexChanged;
```

- `selectedIndex`: An integer representing the index of the currently selected tab.
- `onIndexChanged`: A callback function triggered when the tab index changes.

### Widget Build

The `build()` method of the `MyBottomNavigationBar` widget returns the widget's UI representation.
```dart

    child: Row(
      // Row widget arranges its children in a horizontal row.
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onIndexChanged(0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 150),
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
      ],
    ),
 

- The `build()` method returns a `Container` widget representing the bottom navigation bar.
- The `Container` specifies visual properties such as size, border, and shadow to enhance the UI appearance.
- The main parts of bottom navigation bar consists of two tabs: "Forum" and "Events".
- Each tab is represented by an `Expanded` widget containing a `GestureDetector` wrapped in a `Container`.
- The selected tab has a different visual appearance, including a colored border and shadow this is triggered by the `selectedIndex` which is a `if else` condition to loop through


## EventCard and EventList Widget
These widgets are responsible for displaying event information in a card format.The `EventCard` widget represents a single event card. It takes an `index` parameter to determine the event data to display.

### Widget Properties

The `EventCard` widget has the following properties:
```dart
final int index;
```
- `index`: An integer representing the index of the event in the list of events.

### Widget Build

The `build()` method of the `EventCard` widget returns the widget's UI representation.
```dart
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
          ),
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
        color: Colors.white,
      ),
      child: SizedBox(
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Container(
              color: Colors.white10.withOpacity(0.6),
              child: Column(
                children: [
                  Text(
                    Event.events[index].eventdetails,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    Event.events[index].eventtitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
```

- The `build()` method returns a `Padding` widget to add bottom padding.
- The `Padding` widget contains a `Container` representing the event card.
- The `Container` has a fixed width and height to maintain the card's dimensions.
- The `Container` is styled with a border, box shadow, image, and rounded corners.
- The event image is loaded from an AssetImage based on the `eventimage` property of the event at the given `index`.
- Inside the `Container`, a `SizedBox` is used to set the height for the card's content.
- The card's content is vertically centered using a `Column` widget.
- The event details and title are displayed using `Text` widgets, utilizing the `eventdetails` and `eventtitle` properties of the event at the given `index`.
- The event details text has black color, while the event title text also has black color.

## EventList Widget

We no will displays a list of events using the `EventList` widget implementing the `ListView.builder` constructor.

```dart
@override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: Event.events.length,
    itemBuilder: (BuildContext context, int index) {
      return EventCard(
        index: index,
      );
    },
  );
}
```

- The `ListView.builder` widget is used to efficiently build a scrollable list of events.
- The `itemCount` property is set to the length of the `Event.events` list.
- The `itemBuilder` callback is called for each item in the list and returns an `EventCard` widget with the appropriate `index` value.



With that we have concluded the process for building our CRUD app user interface for the `EventCard` and `EventList` widgets to be displayed in the home page.

###add note widget

### Static data 
To now test our ui we will deed to denerate some mock data to display and for that we will have to create a  data model for  Events



## Event Model

 `Event` model represents an event object with properties such as user ID, event title, event details, and event image URL as follows

```dart
class Event {
  String userid;
  String eventtitle;
  String eventdetails;
  String eventimage;

  Event({
    required this.userid,
    required this.eventtitle,
    required this.eventdetails,
    required this.eventimage,
  });
}
```

- `userid`: A string representing the user ID associated with the event.
- `eventtitle`: A string representing the title of the event.
- `eventdetails`: A string providing additional details or description of the event.
- `eventimage`: A string representing the URL of the image associated with the event.

### List of Events

We also defines a static list called `events`, which contains sample event instances:

```dart
static List<Event> events = [
  Event(
    userid: 'kimani78',
    eventtitle: 'treeplanting',
    eventdetails: 'save the world',
    eventimage: 'images/tree.jpg',
  ),
  Event(
    userid: 'John76',
    eventtitle: 'treeplanting2',
    eventdetails: 'save the world2',
    eventimage: 'images/tree.jpg',
  ),
  Event(
    userid: 'Jane56',
    eventtitle: 'treeplanting3',
    eventdetails: 'save the world3',
    eventimage: 'images/tree.jpg',
  ),
];
```
- We have created each event instance using the `Event` constructor, providing values for the `userid`, `eventtitle`, `eventdetails`, and `eventimage` properties.
