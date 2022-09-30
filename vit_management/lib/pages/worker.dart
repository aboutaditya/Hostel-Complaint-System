import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';
import 'package:vit_management/pages/carpenter.dart';
import 'package:vit_management/pages/home.dart';
import 'package:vit_management/pages/user.dart';

String typew = '';


class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('worker');

  void getUsersData() {
    collectionReference
        .doc(u.FirebaseAuth.instance.currentUser!.email!)
        .get()
        .then((value) {
      var fields = value;

      setState(() {
        typew = fields['type'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(User user) {
    getUsersData();
    if ((user.type == typew) & (user.status == "inc")) {
      return ListTile(
        
        leading: CircleAvatar(backgroundColor: Colors.red),
        title: Text(user.roomno),
        subtitle: Text(user.complaint),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  Stream<List<User>> readUser() => FirebaseFirestore.instance
      .collection('complaint')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
