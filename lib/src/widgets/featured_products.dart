import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/screen_navigation.dart';
import 'package:food_delivery/src/models/product_model.dart';
import 'package:food_delivery/src/providers/products_provider.dart';
import 'package:food_delivery/src/screens/details.dart';
import 'package:provider/provider.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return SizedBox(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    print(productProvider.products[index].name);
                    changeScreen(
                        context,
                        DetailsScreen(
                          product: productProvider.products[index],
                        ));
                  },
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
                      children: [
                        Image.network(
                          productProvider.products[index].image ?? '',
                          fit: BoxFit.cover,
                          height: 140,
                          // width: 140,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: productProvider.products[index].name ??
                                    'asdas',
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
                                  child:
                                      productProvider.products[index].featured!
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
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: productProvider.products[index].rating
                                        .toString(),
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
                                text:
                                    "\$${productProvider.products[index].price}",
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
