import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';
import 'package:food_delivery/src/models/order_model.dart';

class OrderServices {
  String collection = "orders";
  String appName = 'foodAPP';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder(
      {required String userId,
      required String id,
      required String description,
      required String status,
      required List<CartItemModel> cart,
      required double totalPrice}) {
    List<Map> convertedCart = [];
    List<String> restaurantIds = [];

    for (CartItemModel item in cart) {
      convertedCart.add(item.toMap());
      restaurantIds.add(item.restaurantId!);
    }

    _firestore
        .collection(appName)
        .doc(appName)
        .collection(collection)
        .doc(id)
        .set({
      "userId": userId,
      "id": id,
      "restaurantIds": restaurantIds,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  Future<List<OrderModel>> getUserOrders({required String userId}) async =>
      _firestore
          .collection(appName)
          .doc(appName)
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
