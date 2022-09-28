import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vit_management/pages/home.dart';

class delay extends StatelessWidget {
  const delay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
    
  }
}
