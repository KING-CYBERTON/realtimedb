// ignore: file_names
class Event {
  String userid;
  String eventtitle;
  String eventdetails;
  String eventimage; //url for the image

  Event({
    required this.userid,
    required this.eventtitle,
    required this.eventdetails,
    required this.eventimage,
  });
}

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

List<Event> events = [
  Event(
      userid: 'kimani',
      eventtitle: 'treeplanting',
      eventdetails: 'save the world',
      eventimage: 'assets/images/tree.jpg'),
  Event(
      userid: 'kimani2',
      eventtitle: 'treeplanting2',
      eventdetails: 'save the world2',
      eventimage: 'assets/images/tree.jpg'),
  Event(
      userid: 'kimani3',
      eventtitle: 'treeplanting3',
      eventdetails: 'save the world3',
      eventimage: 'assets/images/tree.jpg'),
];
List<Post> posts = [
  Post(userid: 'Wambui', captions: 'Lets make it green'),
  Post(userid: 'Wambui2', captions: 'Lets make it green', photo: 'assets/images/logo.png'),
  Post(userid: 'Wambui3', captions: 'World wide ecosystem')
];
