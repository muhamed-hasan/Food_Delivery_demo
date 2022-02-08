import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/providers/category_provider.dart';
import 'package:food_delivery/src/providers/restaurant_provider%20.dart';
import 'package:food_delivery/src/providers/user_provider.dart';
import 'package:food_delivery/src/screens/home.dart';
import 'package:food_delivery/src/screens/login.dart';
import 'package:food_delivery/src/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error: " + snapshot.toString());
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: UserProvider.initialize()),
              ChangeNotifierProvider.value(
                  value: RestaurantProvider.initialize()),
              ChangeNotifierProvider.value(
                  value: CategoryProvider.initialize()),
            ],
            child: snapshot.connectionState == ConnectionState.waiting
                ? Loading()
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.red,
                    ),
                    home: ScreensController()),
          );
        });
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return const Home();
      default:
        return LoginScreen();
    }
  }
}
