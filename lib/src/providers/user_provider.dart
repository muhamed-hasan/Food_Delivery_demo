import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/src/helpers/user_services.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';
import 'package:food_delivery/src/models/product_model.dart';
import 'package:food_delivery/src/models/user_model.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Unauthenticated, Authenticated, Authenticating }

class UserProvider with ChangeNotifier {
  FirebaseAuth? _auth;
  Status _status = Status.Uninitialized;
  final _fireStore = FirebaseFirestore.instance;
  String appName = 'foodAPP';
  String collection = 'users';
  final _userServices = UserServices();
  UserModel? _userModel;
  User? _user;

//  getter
  UserModel? get userModel => _userModel;
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
      _userModel = await _userServices.getUserById(user!.uid);
    }
    notifyListeners();
  }

  Future<bool> addToCart(
      {required ProductModel product, required int quantity}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List cart = _userModel!.cart!;
//      bool itemExists = false;
      Map<String, dynamic> cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "restaurantId": product.restaurantId.toString(),
        "totalRestaurantSale": product.price! * quantity,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity
      };
      CartItemModel item = CartItemModel.fromMap(cartItem);
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user!.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR333 ${e.toString()}");
      return false;
    }
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user!.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({required CartItemModel cartItem}) async {
    try {
      _userServices.removeFromCart(userId: _user!.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR 4444 ${e.toString()}");
      return false;
    }
  }
}
