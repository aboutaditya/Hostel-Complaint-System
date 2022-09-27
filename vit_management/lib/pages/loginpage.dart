import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vit_management/pages/drawer.dart';
import 'package:vit_management/pages/electrician.dart';
import 'package:vit_management/pages/google_Sign_in.dart';
import 'package:vit_management/pages/home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vit_management/pages/login_drawer.dart';
import 'package:vit_management/pages/login_student_drawer.dart';
import 'package:vit_management/pages/workerlogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Log In!"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          child: Center(
            child: Column(
              children: [
                Image.asset("images/login3.png"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 60)),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Sign in with Google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                    if (GoogleSignInProvider().Sign_in_check = true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Home()),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 62,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: login_student_drawer(),
    );
  }
}
