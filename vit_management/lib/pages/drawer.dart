import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vit_management/pages/google_Sign_in.dart';
import 'package:vit_management/pages/loginpage.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text(user.displayName!),
                  accountEmail: Text(user.email!),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(user.photoURL!),
                  ),
                )),
            const ListTile(
              leading: Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: Text("Registered Complaints",
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              // leading: IconData(0xe3b3, fontFamily: 'MaterialIcons'),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text("Log Out",
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    color: Colors.red,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
