import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:arduino_app/database/model/user.dart';

class MyDataBase {
  static CollectionReference<Userr> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(Userr.collectionName)
        .withConverter<Userr>(
            fromFirestore: (snapshot, options) =>
                Userr.fromFireStore(snapshot.data()),
            toFirestore: (user, options) => user.toFireStore());
  }

  static Future<void> addUser(Userr user) {
    var collection = getUserCollection();
    return collection.doc(user.id).set(user);
  }

  static Future<Userr?> readUser(String id) async {
    var collection = getUserCollection();
    var docSnapahot = await collection.doc(id).get();
    return docSnapahot.data();
  }
}
