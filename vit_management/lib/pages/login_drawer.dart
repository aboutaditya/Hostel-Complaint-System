import 'package:flutter/material.dart';
import 'package:vit_management/pages/loginpage.dart';
import 'package:vit_management/pages/workerlogin.dart';

class login_worker_drawer extends StatelessWidget {
  const login_worker_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Colors.blue,
            child: ListView(children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                leading: const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                title: const Text("Student login",
                    textScaleFactor: 1.25,
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              ListTile(
                tileColor: Colors.white,
                selectedTileColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkerLogin()),
                  );
                },
                leading: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                title: const Text("Worker login",
                    textScaleFactor: 1.25,
                    style: TextStyle(
                      color: Colors.black,
                    )),
              )
            ])));
  }
}
