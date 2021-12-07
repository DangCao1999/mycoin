import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoin/data/model/user.dart';

class UserRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> saveUser(User user) {
    return users.doc(user.id).set(user.toJson());
  }
  // Future<void> saveHistoryCoin(String id) {
  //   return users.add(user})
  // }
}
