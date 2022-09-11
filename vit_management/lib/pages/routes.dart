import 'package:flutter/material.dart';
import 'package:vit_management/pages/home_data.dart';
class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String electrician = "/electrician";
  static String plumber = "/plumber";
  static String carpenter = "/carpenter";
  static String cleaner = "/cleaner";
  static String others = "/others";

}
void switchPage(){
  child: HomeData();
}
