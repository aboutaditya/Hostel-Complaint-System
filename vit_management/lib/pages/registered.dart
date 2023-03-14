import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vit_management/pages/user.dart';

Future<void> _dialogBuilder(BuildContext context, String id) {
  CollectionReference users =
      FirebaseFirestore.instance.collection('complaint');

  Future<void> updateUser() {
    return users
        .doc(id)
        .update({'status': 'comp'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(59, 91, 83, 83),
        title: const Text(
          'Complaint Operations',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Do you wish to set complaint as done',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Done'),
            onPressed: () {
              updateUser();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class Registered extends StatefulWidget {
  const Registered({Key? key}) : super(key: key);

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
    if ((user.mail == u.FirebaseAuth.instance.currentUser!.email!) &
        (user.status == "inc")) {
      return ListTile(
        onTap: (() {
          print("tapped");
          _dialogBuilder(context, user.id);
        }),
        leading: Icon(
          FontAwesomeIcons.clock,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          'Complaint : ${user.complaint}',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        subtitle: Text(
          'Type : ${user.type}',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
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
