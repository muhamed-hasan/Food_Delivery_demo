import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/src/helpers/user_services.dart';
import 'package:food_delivery/src/models/user_model.dart';

enum Status { Uninitialized, Unauthenticated, Authenticated, Authenticating }

class UserProvider with ChangeNotifier {
  FirebaseAuth? _auth;
  Status _status = Status.Uninitialized;
  final _fireStore = FirebaseFirestore.instance;
  String appName = 'foodAPP';
  String collection = 'users';
  final _userServices = UserServices();
  UserModel? userModel;
  User? _user;

  Status get status => _status;
  User? get user => _user;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth?.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth?.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      // notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth!
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _fireStore
            .collection(appName)
            .doc(appName)
            .collection(collection)
            .doc(result.user!.uid)
            .set({
          'name': name.text,
          'email': email.text,
          'uid': result.user!.uid,
          "likedFood": [],
          "likedRestaurants": []
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  signOut() async {
    _auth?.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();

    // return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }

  Future<void> _onStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      userModel = await _userServices.getUserById(user!.uid);
    }
    notifyListeners();
  }
}
