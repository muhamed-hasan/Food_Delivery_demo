import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/category.dart';

List<Category> categories = [
  Category(
    name: "Cake",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
  ),
  Category(
    name: "Pasta",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-2.png?alt=media&token=3ae6f4e6-53cd-4ac1-9e12-b491c351771a",
  ),
  Category(
    name: "Drinks",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-3.png?alt=media&token=43ed89ab-93de-42ca-90df-0231699eebf0",
  ),
  Category(
    name: "Rice",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-4.png?alt=media&token=0c2592ca-7bbc-40fa-80ae-163d739e308f",
  ),
  Category(
    name: "Pasta",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-2.png?alt=media&token=3ae6f4e6-53cd-4ac1-9e12-b491c351771a",
  ),
  Category(
    name: "Drinks",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-3.png?alt=media&token=43ed89ab-93de-42ca-90df-0231699eebf0",
  ),
  Category(
    name: "Rice",
    image:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-4.png?alt=media&token=0c2592ca-7bbc-40fa-80ae-163d739e308f",
  )
];

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
              onTap: () {
                print(categories[index].name);
              },
            );
          },
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
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
                  category.image,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              category.name,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
