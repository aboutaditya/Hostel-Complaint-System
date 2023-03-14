import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Electrician extends StatefulWidget {
  Electrician({Key? key, required this.image, required this.name})
      : super(key: key);
  String image, name;

  @override
  State<Electrician> createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controller4 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String name = widget.name;

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
          regno: regno,
          roomnno: roomno,
          contno: contno,
          complaint: complaint,
          type: widget.name);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complaint registered')),
      );
      // List<String> recipents = ['9818523384'];
      // _sendSMS('$roomno-$complaint', recipents);
      Navigator.of(context).pop();
    }
  }

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
        title: Text("$name Complaint"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    widget.image,
                    height: 200,
                  ),
                  Row(
                    children: [
                      Text(
                        "Registration No :",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        controller: controller1,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Registration Number";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Registration No.",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        "Room Number :",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: controller2,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Room Number";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Room no.",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        "Contact Number :",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: controller3,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Contact Number";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Contact no.",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        "Enter Complaint :",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: controller4,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Enter the issue!";
                          } else {
                            return null;
                          }
                        }),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Enter issue",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      _saveForm();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Icon(FontAwesomeIcons.arrowRight)
                          ],
                        ),
                      ),
                    ),
                  )
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
      required String type,
      required complaint}) async {
    final docUser = FirebaseFirestore.instance.collection('complaint').doc();
    String mail = FirebaseAuth.instance.currentUser!.email!;
    final json = {
      'id': docUser.id,
      'type': type,
      'mail': mail,
      'regno': regno,
      'roomno': roomnno,
      'contno': contno,
      'complaint': complaint,
      'status': 'inc'
    };
    await docUser.set(json);
  }
}
