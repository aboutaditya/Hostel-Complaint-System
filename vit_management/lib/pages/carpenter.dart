import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sms/flutter_sms.dart';
void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
class carpenter extends StatefulWidget {
  carpenter({Key? key}) : super(key: key);

  @override
  State<carpenter> createState() => _carpenterState();
}

class _carpenterState extends State<carpenter> {
  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controller4 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _saveForm() async {
    final f1 = _formKey.currentState!.validate();

    if (!f1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter details correctly')),
      );
    } else {
      String regno = await controller1.text;
      String roomno = await controller2.text;
      String contno = await controller3.text;
      String complaint = await controller4.text;
      await createUser(
          regno: regno, roomnno: roomno, contno: contno, complaint: complaint);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complaint registered')),
      );
      Navigator.of(context).pop();

      // List<String> recipents = ['9818523384'];
      // _sendSMS('$roomno-$complaint', recipents);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Carpenter Complaint"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "images/carpenter.jpg",
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
                  SizedBox(
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
                        hintText: "Enter Room no.",
                        labelText: "Room No. :"),
                  ),
                  SizedBox(
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
                        hintText: "Enter Contact no.",
                        labelText: "Contact No. :"),
                  ),
                  SizedBox(
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
                        hintText: "Enter issue",
                        labelText: "Issue :"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _saveForm();
                      },
                      child: Text("Submit"))
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
      'type': 'carpenter',
      'mail': mail,
      'regno': regno,
      'roomno': roomnno,
      'contno': contno,
      'complaint': complaint,
      'status':'inc'

    };
    await docUser.set(json);
  }
}
