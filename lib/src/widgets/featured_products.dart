import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/product.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<Product> productsList = [
  Product(
      name: "Pizza",
      price: 20.0,
      rating: 4.3,
      vendor: "Papa's Pizza",
      wishList: false,
      image: "5.jpg"),
  Product(
      name: "Fried rice",
      price: 20.0,
      rating: 4.3,
      vendor: "Papa's Pizza",
      wishList: true,
      image: "1.jpg"),
  Product(
      name: "Jollof rice",
      price: 20.0,
      rating: 4.3,
      vendor: "Papa's Pizza",
      wishList: true,
      image: "1.jpg"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 220,
                    width: 200,
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: Colors.red[50]!,
                          offset: const Offset(15, 5),
                          blurRadius: 30),
                    ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "images/${productsList[index].image}",
                          height: 140,
                          width: 140,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: productsList[index].name,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300]!,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: productsList[index].wishList
                                      ? const Icon(
                                          Icons.favorite,
                                          color: red,
                                          size: 18,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          color: red,
                                          size: 18,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: productsList[index].rating.toString(),
                                    color: grey,
                                    size: 14.0,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 16,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                text: "\$${productsList[index].price}",
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
