import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vit_management/pages/user.dart';

class plum_worker extends StatelessWidget {
  const plum_worker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plumber Complaints"),
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
    if (user.type == 'plumber') {
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
