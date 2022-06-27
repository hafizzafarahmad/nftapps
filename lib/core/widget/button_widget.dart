import 'package:flutter/material.dart';

import '../styles/color_apps.dart';

//all Button of this app customize here
class ButtonWidget{
  // this constructor prevents instantiation and extension.
  ButtonWidget._();

  static Widget light({VoidCallback? onPress, required String text, double? fontSize}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        side:  BorderSide(width: 1, color: ColorApps.primaryColor,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),)
        ),
        primary: Colors.white,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }

  static Widget submit({VoidCallback? onPress, required String text, double? fontSize}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        side:  BorderSide(width: 2, color: ColorApps.primaryColor,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),)
        ),
        primary:  ColorApps.primaryColor,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }
}

