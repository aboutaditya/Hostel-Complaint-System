import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vit_management/pages/electrician.dart';
import 'package:vit_management/pages/home.dart';
import 'package:vit_management/pages/login_drawer.dart';

class WorkerLogin extends StatelessWidget {
  WorkerLogin({Key? key}) : super(key: key);
  CollectionReference<Map<String, dynamic>> passw =
      FirebaseFirestore.instance.collection('workerlogin');
  @override
  Widget build(BuildContext context) {
    final user_controller = TextEditingController();
    final pass_controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Worker Log In!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: user_controller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Enter User ID";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter User ID",
                            labelText: "User ID:"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: pass_controller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Password",
                            labelText: "Password:"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: user_controller.text,
                                  password: pass_controller.text);
                          print("login");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Electrician()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      child: Text(
                        "Log In!",
                        style: TextStyle(fontSize: 22),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(140, 50)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: login_drawer(),
    );
  }
}
