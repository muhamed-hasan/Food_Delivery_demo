import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/Restaurant_services.dart';
import 'package:food_delivery/src/models/restaurant_model.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _RestaurantServices = RestaurantServices();
  List<RestaurantModel> _restaurants = [];

  RestaurantProvider.initialize() {
    _loadCategories();
  }

  List<RestaurantModel> get restaurants => _restaurants;

  _loadCategories() async {
    _restaurants = await _RestaurantServices.getRestaurants();
    notifyListeners();
  }
}
