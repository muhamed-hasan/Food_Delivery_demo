import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  String? _name;
  String? _email;
  String? _id;
  String? _stripeId;
  List<CartItemModel>? cart;
  double totalCartPrice = 0;
  double _priceSum = 0;
  int _quantitySum = 0;

//  getters
  String get name => _name ?? 'user';
  String get email => _email!;
  String get id => _id!;
  String? get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    _name = data[NAME];
    _email = data[EMAIL];
    _id = data[ID];
    _stripeId = data[STRIPE_ID];
    cart = _convertCartItems(data[CART] ?? []);
    totalCartPrice = data[CART] == null ? 0 : getTotalPrice(cart: data[CART]);
  }
  double getTotalPrice({required List? cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map<String, dynamic> cartItem in cart) {
      _priceSum += cartItem["price"] * cartItem["quantity"] as double;
    }

    double total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map<String, dynamic> cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
