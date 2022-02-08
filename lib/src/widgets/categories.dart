import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/category.dart';
import 'package:food_delivery/src/providers/category_provider.dart';
import 'package:provider/provider.dart';

// List<CategoryModel> categories = [];

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryProvider.categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryProvider.categories[index],
              onTap: () {
                print(categoryProvider.categories[index].name);
              },
            );
          },
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final Function() onTap;

  CategoryCard({required this.category, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0, color: const Color(0xffFF8527)),
                  borderRadius: BorderRadius.circular(20.0)),
              child: ClipRRect(
                  child: Image.network(
                    category.image!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              category.name ?? 'error',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
