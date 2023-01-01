import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_report/models/event_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:book_report/pages/login_page.dart';
import 'package:book_report/shared/authentication.dart';

class EventScreen extends StatelessWidget {
  final String uid;
  const EventScreen(this.uid);

  @override
  Widget build(BuildContext context) {
    final Authentication auth = Authentication();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Event'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                auth.signOut().then((result) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            )
          ],
        ),
        body: EventList());
  }
}

class EventList extends StatefulWidget {
  EventList() {
    Firebase.initializeApp();
  }

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<EventDetail> details = [];
  //List<Favorite> favorites = [];
  @override
  void initState() {
    if (mounted) {
      getDetailsList().then((data) {
        setState(() {
          details = data;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (details != null) ? details.length : 0,
      itemBuilder: (context, position) {
        String sub =
            'Date: ${details[position].date} - Start: ${details[position].startTime} - End: ${details[position].endTime}';
        //Color starColor = (isUserFavorite(details[position].id) ? Colors.amber : Colors.grey);
        return ListTile(
          title: Text(details[position].description),
          subtitle: Text(sub),
          // trailing: IconButton(
          //   icon: Icon(Icons.star, color: starColor),
          //   onPressed: () {toggleFavorite(details[position]);},
          // ),
        );
      },
    );
  }

  Future<List<EventDetail>> getDetailsList() async {
    var data = await db.collection('event_details').get();
    details =
        data.docs.map((document) => EventDetail.fromMap(document)).toList();
    int i = 0;
    for (var detail in details) {
      detail.id = data.docs[i].id;
      i++;
    }
    return details;
  }
}
