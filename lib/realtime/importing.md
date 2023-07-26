To get started with reading and writting data in the real time data base we need to first create the database in our project n firebase console.We will follow the follow steps in the ensuing slides to do so.

*slides*
 
## Setting up Firebase Realtime Database in Flutter

Before we begin, we will need intergrate the realtime database in our flutter app, following these steps below:

1. First add the `firebase_database` package to the `pubspec.yaml` file.
2. Next we will add the `databaseURL` to the `main.dart` file on web firebase initialization.The following code snippet show how this is achived.
   ```dart

        apiKey: "AIzaSyAmOB_-8DIEIwJEOvrM2a8C6RE-KbvSDDc",
        projectId: "educative-9",
        storageBucket: "educative-9.appspot.com",
        //here is the line
         databaseURL: "https://educative-9-default-rtdb.firebaseio.com", 
        messagingSenderId: "14205101883",
        appId:"1:14205101883:web:7c0db5d88bc2dc0310791e",
  
   ```

Now, let's dive into reading and writing data in Firebase Realtime Database.

## Writing Data to Firebase Realtime Database

To write data into ur realtime database we will create a controller to handle this function and a data nodel to help with sructuring our data. In this case as we are creating an app for  plaing trees we will aslso need to create a page where users post their progress or thought on the plating trees.

First we need to ask ourselves what the user might need to post. For examle a user may post a picture and acaption to detail the phot posted. As such we now have to data to store in our realtime database the userid, to track the post, the photourl sas realrime database can only store JSON data and the caption.

We will now model the data in the following `Post` class
```dart

class Post {
  String userid;
  String? photo;
  String captions;

  Post({
    required this.userid,
    this.photo,
    required this.captions,
  });
}
```
the class above has the photourl as nullable as we must factor in that the user can post an informative caption with out a photo

Next we will now delve into creating the contoller as displayd in the snippet below

```dart
class Realtime extends GetxController {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  void addPost(String userId, String photoURL, String captions) async {
    try {
      Map<String, dynamic> postData = {
        'userid': userId,
        'captions': captions,
        'photo': photoURl,
      };
      await _database.child('posts').push().set(postData).then((_) {
        Get.snackbar(
          'Success',
          'Info has been updated',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
          colorText: Colors.black87,
        );
      }).catchError((e) {
        Get.snackbar(
          'Error',
          'Something went wrong',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.black,
        );
      });
    } catch (e) {
      print('Error adding post: $e');
    }
  }

}
```
The `addPost2` method is a function defined within the `Realtime` class, which is a controller class in the Flutter GetX state management library. This method is responsible for adding a new post to the Firebase Realtime Database with minimal data, specifically `userId` `photourl` and `captions`. 

Explanation:

1. We create a method takes three parameters, `userId` ,`photourl` and `captions`, which represent the data to be added to the new post.

2. Inside the method, a `Map<String, dynamic>` called `postData` is created to store the data for the new post. This map contains two key-value pairs: `'userid': userId` and `'captions': captions`.

3. We then use the `_database` object, which represents the Firebase Realtime Database, to add the `postData` to the 'posts' node in the database. The `push()` method generates a unique key for the new post, and the `set()` method saves the `postData` under that key.

4. The `await` keyword is used to ensure that the data is successfully written to the database before proceeding.

5. If the data is successfully added, a success snackbar is shown using the `Get.snackbar` method from the GetX library. This snackbar displays a brief message indicating that the information has been updated.

6. If there is an error while adding the data (e.g., due to connectivity issues or database rules violation), an error snackbar is displayed, notifying the user that something went wrong.

7. The code is wrapped in a `try-catch` block to handle any exceptions that might occur during the process. If an error occurs, it will be caught and the error message will be printed using `print('Error adding post: $e')`.

In conclusion the method `addPost` , use the `set` method to write data to the Realtime Database. They create a new post node under the 'posts' node, and the data is automatically assigned a unique key using the `push` method.

Finally, to implement this we will need to add the controller in our user interface as follows:

```dart
 ElevatedButton(
                onPressed: () async {
                String captions = captioncontroller.text.trim();
                if (photo != null && photo.isNotEmpty) {
                controller.addPost(userid, photo, captions);
                } else {
               controller.addPost2(userid,captions);
               }       
             },
           child: const Text('Publish')
 )
```
The onPressed callback of the `"Publish"` button triggers the process of adding the new post to the database. It checks if a photo is selected `(photo.isNotEmpty)` and calls the appropriate method on the controller `(either addPost or addPost2)` to add the post data to the Firebase Realtime Database.

The captioncontroller.text.trim() retrieves the text entered in the CustomText widget (the captions of the new post) and removes any leading and trailing white spaces using trim().

## Reading Data
Now having written our post on the realtim database we will need to read the data and display it on the UI. To do this we will need to modifief the list widget we created  as shown below:

```dart

```

In the provided code, we create a `FirebaseAnimatedList`,this a widget used to display data from Firebase Realtime Database in real-time. Let's explain each part of the code:

1. `final DatabaseReference _database`: This line creates a reference to the root of the Firebase Realtime Database. The `FirebaseDatabase.instance` provides access to the Firebase Realtime Database, and `.ref()` creates a reference to the root node of the database.

2. The `build` method returns a `FirebaseAnimatedList` widget. This widget listens to changes in the database and automatically updates the UI in realtime whenever the data changes.

3. The `query` parameter of `FirebaseAnimatedList` specifies the location in the database from which the data will be fetched. In this case, it queries the 'posts' node in the database using `_database.child('posts')`.

4. The `itemBuilder` parameter is a callback function that defines how each item in the list is rendered. It takes the `BuildContext`, a `DataSnapshot`, an `Animation<double>`, and the `index` of the item being built.

5. Inside the `itemBuilder` function, the `snapshot` contains the data of each post as a `DataSnapshot`. The data is retrieved using `snapshot.value`, and it is cast as a `Map` with `as Map`. The `snapshot.key` represents the unique key of the current post.

6. The code then creates a new instance of a `PostCard` widget, passing the post data (`Post`) as a parameter.

7. The `PostCard` widget (not provided in the code snippet) is likely responsible for displaying the post data in a visually appealing way.

Overall, the `FirebaseAnimatedList` efficiently renders a list of posts from the 'posts' node in the Firebase Realtime Database, and it automatically updates the UI whenever new posts are added or existing posts are modified. This provides realtime synchronization of data between the database and the Flutter app, making it easy to display live data to users.

## Importing and Exporting JSON Data

JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for both humans and machines to read and write. Firebase Realtime Database stores data in a JSON-like format, making it easy to import and export data as JSON.

To export data as JSON, you can use the Firebase Console:

1. Go to the Firebase Console and select your project.
2. Navigate to the "Database" section.
3. Click on the "Export JSON" option, and the data will be downloaded as a JSON file.

To import JSON data to the Realtime Database, you can use the Firebase Console as well:

1. Go to the Firebase Console and select your project.
2. Navigate to the "Database" section.
3. Click on the "Import JSON" option, and you can choose a JSON file to upload to the database.

## Conclusion

In this lesson, we explored how to read and write data in Firebase Realtime Database using Flutter. We looked at an example code snippet that demonstrates how to add posts to the database with various attributes. Additionally, we briefly discussed how to import and export data in JSON format using the Firebase Console.
