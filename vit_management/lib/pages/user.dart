// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String regno;
  final String roomno;
  final String contno;
  final String complaint;
  final String mail;
  User({
    required this.regno,
    required this.roomno,
    required this.contno,
    required this.complaint,
    required this.mail,
  });
  Map<String, dynamic> toJson() => {
        'regno': regno,
        'roomno': roomno,
        'contno': contno,
        'complaint': complaint,
        'mail': mail,
      };
  static User fromJson(Map<String, dynamic> json) => User(
      regno: json['regno'],
      roomno: json['roomno'],
      contno: json['contno'],
      complaint: json['complaint'],
      mail: json['mail']);
}
