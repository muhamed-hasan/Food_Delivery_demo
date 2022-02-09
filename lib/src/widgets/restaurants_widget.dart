import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/style.dart';
import 'package:food_delivery/src/models/restaurant_model.dart';
import 'package:food_delivery/src/providers/restaurant_provider%20.dart';
import 'package:food_delivery/src/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resProvider = Provider.of<RestaurantProvider>(context);
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: resProvider.restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantsCard(
            onTap: () {},
            restaurant: resProvider.restaurants[index],
          );
        },
      ),
    );
  }
}

class RestaurantsCard extends StatelessWidget {
  final RestaurantModel restaurant;
  final Function() onTap;

  const RestaurantsCard(
      {Key? key, required this.restaurant, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: restaurant.image!,
                  // width: 300,
                  fit: BoxFit.fitHeight),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButton(Icons.favorite),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 20,
                          ),
                        ),
                        Text(restaurant.rating.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ],
                  )),
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "${restaurant.name} \n",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Avg meal price: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: "\$${restaurant.avgPrice}\n",
                      style: TextStyle(fontSize: 16)),
                ], style: TextStyle(color: white)),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
