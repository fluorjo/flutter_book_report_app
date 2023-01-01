import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  late String _id;
  late String _eventId;
  late String _userId;
  Favorite(this._id, this._eventId, this._userId);

  String get eventId => _eventId;
  String get id => _id;

  Favorite.map(DocumentSnapshot document) {
    this._id = document.id;
    _eventId = (document.data as DocumentSnapshot)['eventId'];
    //this._eventId = document.data()['eventId'];
    //(snapshot.data as DocumentSnapshot)['username']
    _userId = (document.data as DocumentSnapshot)['userId'];
  }

  Map<String, dynamic> toMap() {
    var map2 = Map<String, dynamic>();
    map2;

    if (_id != null) {
      map2['id'] = _id;
    }
    map2['eventId'] = _eventId;
    map2['userId'] = _userId;
    return map2;
  }
}
