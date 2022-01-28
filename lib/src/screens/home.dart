import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/style.dart';
import 'package:food_delivery/src/widgets/categories.dart';
import 'package:food_delivery/src/widgets/custom_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController? search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'what would you like to eat?',
                  size: 18,
                ),
              ),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none)),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: red, borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ],
          ),
          // Search BOX
          SearchInput(textController: search!, hintText: "Search"),
          CategoriesList()
        ],
      )),
    );
  }
}

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchInput(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 5,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          controller: textController,
          onChanged: (value) {
            //Do something wi
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: red),
            suffixIcon: const Icon(Icons.filter_list, color: red),
            filled: true,
            fillColor: white,
            hintText: hintText,
            hintStyle: const TextStyle(color: grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
          ),
        ),
      ),
    );
  }
}
