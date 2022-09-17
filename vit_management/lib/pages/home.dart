import 'package:flutter/material.dart';
import 'package:vit_management/pages/home_data.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Complaint System"),
        centerTitle: true,
      ),
      body:HomeData(),
      drawer: drawer(),
    );
  }
}
