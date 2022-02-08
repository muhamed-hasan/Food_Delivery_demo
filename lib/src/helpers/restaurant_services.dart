import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/src/models/restaurant_model.dart';

//! get Data from FireStore

class RestaurantServices {
  String appName = 'foodAPP';

  String collection = "restaurants";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RestaurantModel>> getRestaurants() async => _firestore
          .collection(appName)
          .doc(appName)
          .collection(collection)
          .get()
          .then((result) {
        List<RestaurantModel> restaurants = [];
        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });
}
