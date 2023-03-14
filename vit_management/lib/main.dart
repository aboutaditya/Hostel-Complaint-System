import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;
  checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (mounted) {
          setState(() {
            login = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            login = true;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => GoogleSignInProvider()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: login ? Home() : LoginPage(),
        ));
  }
}
