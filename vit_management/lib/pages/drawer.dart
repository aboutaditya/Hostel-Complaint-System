import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vit_management/pages/google_Sign_in.dart';
import 'package:vit_management/pages/loginpage.dart';
import 'package:vit_management/pages/registered.dart';
import 'package:vit_management/pages/restart.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String usern = user.displayName!;
    String emaill = user.email!;
    String purl = user.photoURL!;
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text(usern),
                  accountEmail: Text(emaill),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(purl),
                  ),
                )),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Registered()),
                );
              },
              leading: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: const Text("Registered Complaints",
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ListTile(
              onTap: () async {
                await GoogleSignIn().disconnect();
                await FirebaseAuth.instance.signOut();
                RestartWidget.restartApp(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginPage()),
                // );
              },
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
