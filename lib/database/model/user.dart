import 'package:firebase_auth/firebase_auth.dart';

class Userr {
  String? id;
  String? name;
  String? email;
  static const String collectionName = 'users';
  Userr({this.id, this.name, this.email});

  Userr.fromFireStore(Map<String, dynamic>? data) {
    id = data?['id'];
    name = data?['name'];
    email = data?['email'];
  }
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
