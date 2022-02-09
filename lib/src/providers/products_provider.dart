import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/category_services.dart';
import 'package:food_delivery/src/helpers/products_services.dart';
import 'package:food_delivery/src/models/product_model.dart';
import '../models/category.dart';

class ProductsProvider with ChangeNotifier {
  ProductService _productServices = ProductService();
  List<ProductModel> _products = [];

  ProductsProvider.initialize() {
    _loadProducts();
  }

  List<ProductModel> get products => _products;

  _loadProducts() async {
    _products = await _productServices.getProducts();

    notifyListeners();
  }
}
