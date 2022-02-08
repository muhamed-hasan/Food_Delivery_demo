import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/category.dart';
import 'package:food_delivery/src/providers/category_provider.dart';
import 'package:food_delivery/src/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
                  borderRadius: BorderRadius.circular(10.0)),
              child: Stack(
                children: [
                  Positioned.fill(child: Loading()),
                  ClipRRect(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: category.image!,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
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
