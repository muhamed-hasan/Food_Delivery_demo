import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/src/helpers/style.dart';

import 'package:food_delivery/src/models/product.dart';
import 'package:food_delivery/src/widgets/custom_text.dart';

class DetailsScreen extends StatefulWidget {
  Product product;

  DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Center(
                    child: CarouselSlider(
                      // TODO

                      items: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset('images/${widget.product.image}'),
                        Image.asset('images/${widget.product.image}'),
                      ],
                      options: CarouselOptions(
                          viewportFraction: .7,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  //! Caserol Slider Indentation . . . ========================
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      color: white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // TODO Chanege List
                        children: [1, 1, 3].asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : red)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  //! Top Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "images/shopping-bag.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: grey,
                                          offset: Offset(2, 1),
                                          blurRadius: 3,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0),
                                    child: CustomText(
                                      text: "2",
                                      color: red,
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  //! Add to favorite
                  Positioned(
                    right: 20,
                    bottom: 55,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400]!,
                              offset: const Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.favorite, size: 22, color: red),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 15),
            //! Details
            CustomText(
                text: widget.product.name, size: 26, weight: FontWeight.bold),
            CustomText(
                text: "\$" + widget.product.price.toString(),
                size: 20,
                weight: FontWeight.w400),
            const SizedBox(height: 15),
//! Add And Remove
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        size: 36,
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
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: "Add to Bag",
                        color: white,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                        color: red,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
