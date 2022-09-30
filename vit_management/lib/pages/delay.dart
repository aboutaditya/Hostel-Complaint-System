import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vit_management/pages/home.dart';

class delay extends StatefulWidget {
  const delay({Key? key}) : super(key: key);

  @override
  State<delay> createState() => _delayState();
}

class _delayState extends State<delay> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
