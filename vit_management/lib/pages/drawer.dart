import 'package:flutter/material.dart';
import 'package:vit_management/pages/loginpage.dart';


class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children:  [
            
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Your Name"),
                  accountEmail: Text("Registration Number"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.jpg"),
                  ),
                )),
            const ListTile(
              leading: Icon(Icons.list,color: Colors.white,),
              title: Text("Registered Complaints",
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
              },
              // leading: IconData(0xe3b3, fontFamily: 'MaterialIcons'),
              leading: const Icon(Icons.logout,color: Colors.red,),
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
