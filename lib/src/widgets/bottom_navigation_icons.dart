import 'package:flutter/material.dart';

import 'package:food_delivery/src/widgets/custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function()? onPressed;

  const BottomNavIcon({
    Key? key,
    required this.image,
    required this.name,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/$image",
              width: 20,
              height: 20,
            ),
            const SizedBox(height: 2),
            CustomText(
              text: name,
            )
          ],
        ),
      ),
    );
  }
}
