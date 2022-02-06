import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/models/user_model.dart';

// Create and get user from FireStore
class UserServices {
  String appName = 'foodAPP';
  String collection = 'users';
  final _fireStore = FirebaseFirestore.instance;

  Future<void> createUser(Map<String, dynamic> values) async {
    String id = values['id'];
    _fireStore
        .collection(appName)
        .doc(collection)
        .collection(collection)
        .doc(id)
        .set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    String id = values['id'];
    _fireStore
        .collection(appName)
        .doc(collection)
        .collection(collection)
        .doc(values[id])
        .update(values);
  }

  Future<UserModel>? getUserById(String id) {
    _fireStore
        .collection(appName)
        .doc(collection)
        .collection(collection)
        .doc(id)
        .get()
        .then((value) => UserModel.fromSnapshot(value));
  }
}
