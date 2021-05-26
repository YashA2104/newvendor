import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/route.dart';
import 'package:vendor/screens/home/home.dart';
import 'package:vendor/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Color.fromRGBO(241, 241, 241, 1),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColor),
            bodyText2: TextStyle(color: kTextColor),
          )),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
