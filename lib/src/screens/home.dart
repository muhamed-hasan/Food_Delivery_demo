import 'package:flutter/material.dart';
import 'package:food_delivery/src/helpers/screen_navigation.dart';
import 'package:food_delivery/src/helpers/style.dart';
import 'package:food_delivery/src/models/category.dart';
import 'package:food_delivery/src/providers/category_provider.dart';
import 'package:food_delivery/src/providers/user_provider.dart';

import 'package:food_delivery/src/screens/bag.dart';
import 'package:food_delivery/src/widgets/categories.dart';
import 'package:food_delivery/src/widgets/custom_text.dart';
import 'package:food_delivery/src/widgets/featured_products.dart';
import 'package:food_delivery/src/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController? search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: 'Food App',
            color: grey,
            size: 18,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    changeScreen(context, BagScreen());
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
            ],
          ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications_none)),
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
      drawer: myDrawer(userProvider),
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
        children: [
          //! Search BOX
          SearchInput(textController: search!, hintText: "Search"),
          CategoriesList(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Featured', size: 20, color: grey)),
          Featured(),

          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Pupular', size: 20, color: grey)),
          //! POPULAR PRODUCT
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("images/food.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow[900],
                                  size: 20,
                                ),
                              ),
                              Text("4.5"),
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
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Pizza with Pork \n",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "by: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: "Papas Pizza \n",
                                style: TextStyle(fontSize: 16)),
                          ], style: TextStyle(color: white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "\$25.00 \n",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ], style: TextStyle(color: white)),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      )),
    );
  }

  Drawer myDrawer(UserProvider UserProvider) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: primary),
            accountName: CustomText(
              text: UserProvider.userModel?.name ?? 'email',
              color: white,
              weight: FontWeight.bold,
              size: 18,
            ),
            accountEmail: CustomText(
              text: UserProvider.userModel?.email ?? 'error',
              color: white,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: CustomText(text: "Home"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.fastfood),
            title: CustomText(text: "Food I like"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.restaurant),
            title: CustomText(text: "Liked restaurants"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.bookmark_border),
            title: CustomText(text: "My orders"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
            title: CustomText(text: "Cart"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: CustomText(text: "Settings"),
          ),
        ],
      ),
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
    return Container(
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
    );
  }
}
