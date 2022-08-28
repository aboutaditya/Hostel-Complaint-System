import 'package:flutter/material.dart';
import 'package:vit_management/pages/loginpage.dart';
import 'pages/home.dart';
import 'pages/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
          "/": (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => Home(),
          MyRoutes.loginRoute: (context) => const LoginPage()
        },
    );
  }
}
