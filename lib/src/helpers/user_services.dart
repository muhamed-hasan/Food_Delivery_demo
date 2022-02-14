import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';
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
        .doc(appName)
        .collection(collection)
        .doc(id)
        .set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    String id = values['id'];
    _fireStore
        .collection(appName)
        .doc(appName)
        .collection(collection)
        .doc(values[id])
        .update(values);
  }

  Future<UserModel?> getUserById(String id) async {
    var user = await _fireStore
        .collection(appName)
        .doc(appName)
        .collection(collection)
        .doc(id)
        .get();
    return UserModel.fromSnapshot(user);
  }

  void addToCart({required String userId, required CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _fireStore
        .collection(appName)
        .doc(appName)
        .collection(collection)
        .doc(userId)
        .update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart(
      {required String userId, required CartItemModel cartItem}) {
    _fireStore
        .collection(appName)
        .doc(appName)
        .collection(collection)
        .doc(userId)
        .update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
