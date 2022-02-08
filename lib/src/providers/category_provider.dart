import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/category_services.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> _categories = [];

  CategoryProvider.initialize() {
    _loadCategories();
  }

  List<CategoryModel> get categories => _categories;

  _loadCategories() async {
    _categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
