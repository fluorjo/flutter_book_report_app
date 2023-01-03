import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  late String _id;
  late String _eventId;
  late String _userId;
  Favorite(this._id, this._eventId, this._userId);

  String get eventId => _eventId;
  String get id => _id;

  Favorite.map(DocumentSnapshot document) {
    _id = document.id;
    _eventId = (document.data() as dynamic)['eventId'];
    _userId = (document.data() as dynamic)['userId'];
  }

  Map<String, dynamic> toMap() {
    var map2 = <String, dynamic>{};
    map2;

    map2['id'] = _id;
    map2['eventId'] = _eventId;
    map2['userId'] = _userId;
    return map2;
  }
}
