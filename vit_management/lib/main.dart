import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vit_management/firebase_options.dart';
import 'package:vit_management/pages/google_Sign_in.dart';
import 'package:vit_management/pages/loginpage.dart';
import 'package:vit_management/pages/restart.dart';
import 'pages/home.dart';
import 'pages/routes.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    RestartWidget(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (GoogleSignInProvider().Sign_in_check = true) {
      return ChangeNotifierProvider(
        create: ((context) => GoogleSignInProvider()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            MyRoutes.homeRoute: (context) => Home(),
            MyRoutes.loginRoute: (context) => const LoginPage()
          },
        ),
      );
    } else {
      return ChangeNotifierProvider(
        create: ((context) => GoogleSignInProvider()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            MyRoutes.homeRoute: (context) => Home(),
            MyRoutes.loginRoute: (context) => const LoginPage()
          },
        ),
      );
    }
  }
}
