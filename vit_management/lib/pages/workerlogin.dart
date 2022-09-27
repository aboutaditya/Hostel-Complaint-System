import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vit_management/pages/login_drawer.dart';
import 'package:vit_management/pages/worker.dart';

class WorkerLogin extends StatelessWidget {
  WorkerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Worker Log In!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userController,
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
                        controller: passController,
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
                                  email: userController.text,
                                  password: passController.text);
                          print("login");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Screen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(140, 50)),
                      ),
                      child: const Text(
                        "Log In!",
                        style: TextStyle(fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: login_worker_drawer(),
    );
  }
}
