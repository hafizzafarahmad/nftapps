import 'package:flutter/material.dart';

class SizeApps{
  // this constructor prevents instantiation and extension.
  SizeApps._();

  //Size based on width of screen
  static double width(BuildContext context, {required size}){
    var sized = MediaQuery.of(context).size.width * size;
    return sized;
  }

  //Size based on height of screen
  static double height(BuildContext context, {required size}){
    var sized = MediaQuery.of(context).size.height * size;
    return sized;
  }
}

