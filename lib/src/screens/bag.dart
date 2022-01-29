import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/style.dart';
import 'package:food_delivery/src/models/product.dart';
import 'package:food_delivery/src/widgets/custom_text.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  Product product = Product(
      name: "Pizza",
      price: 20.0,
      rating: 4.3,
      vendor: "Papa's Pizza",
      wishList: false,
      image: "5.jpg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: black),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Shopping Bag",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "images/shopping-bag.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 7,
                  bottom: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400]!,
                              offset: const Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: CustomText(
                          text: "2",
                          color: red,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: red.withOpacity(0.1),
                        offset: const Offset(3, 30),
                        blurRadius: 50)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(
                    "images/${product.image}",
                    height: 150,
                    width: 150,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: product.name + "\n",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\$" + product.price.toString() + "",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300)),
                          ]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(Icons.delete), onPressed: null),
                            //! Add And Remove
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        // TODO:Add functionality
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: red,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: CustomText(
                                        text: "Add to Bag",
                                        color: white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 25,
                                        color: red,
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
