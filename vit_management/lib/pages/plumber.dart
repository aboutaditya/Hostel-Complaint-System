import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class plumber extends StatelessWidget {
  plumber({Key? key}) : super(key: key);
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Plumber Complaint"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
            child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/plumber.jpg",
                height: 250,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                controller: controller1,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Registration Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: "Enter Registration Number",
                    labelText: "Registration No. :"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller2,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Room Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: "Enter Room no.", labelText: "Room No. :"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller3,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Contact Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: "Enter Contact no.", labelText: "Contact No. :"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller4,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter the issue!";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: "Enter issue", labelText: "Issue :"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    String regno = controller1.text;
                    String roomno = controller2.text;
                    String contno = controller3.text;
                    String complaint = controller4.text;
                    createUser(
                        regno: regno,
                        roomnno: roomno,
                        contno: contno,
                        complaint: complaint);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit"))
            ],
          ),
        )),
      ),
    );
  }

  Future createUser(
      {required String regno,
      required String roomnno,
      required String contno,
      required complaint}) async {
    final docUser = FirebaseFirestore.instance.collection('complaint').doc();
    String mail = FirebaseAuth.instance.currentUser!.email!;

    final json = {
      'type': 'plumber',
      'mail': mail,
      'regno': regno,
      'roomno': roomnno,
      'contno': contno,
      'complaint': complaint
    };
    await docUser.set(json);
  }
}
