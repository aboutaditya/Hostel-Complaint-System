import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';
import 'package:vit_management/pages/user.dart';

class Registered extends StatelessWidget {
  const Registered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Registered Complaint"),
      ),
      body: StreamBuilder<List<User>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            // return Text('$users.contains("mail")');
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
    if (user.mail == u.FirebaseAuth.instance.currentUser!.email!) {
      return ListTile(
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
