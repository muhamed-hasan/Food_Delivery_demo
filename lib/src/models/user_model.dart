import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";

  String? _name;
  String? _email;
  String? _id;

//  getters
  String get name => _name ?? 'user';
  String get email => _email!;
  String get id => _id!;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    _name = data[NAME];
    _email = data[EMAIL];
    _id = data[ID];
  }
}
