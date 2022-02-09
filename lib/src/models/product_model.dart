import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";

  String? _id;
  String? _name;
  String? _restaurantId;
  String? _restaurant;
  String? _category;
  String? _image;
  double? _rating;
  double? _price;
  int? _rates;

  bool? _featured;

  String? get id => _id;

  String? get name => _name;

  String? get restaurant => _restaurant;

  String? get restaurantId => _restaurantId;

  String? get category => _category;

  String? get image => _image;

  double? get rating => _rating;

  double? get price => _price;

  bool? get featured => _featured;

  int? get rates => _rates;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _restaurant = data[RESTAURANT];
    _restaurantId = data[RESTAURANT_ID];
    _id = data[ID];
    _featured = data[FEATURED];
    _price = data[PRICE];
    _category = data[CATEGORY];
    _rating = data[RATING];
    _rates = data[RATES];
  }
}
