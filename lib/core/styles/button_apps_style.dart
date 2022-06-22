import 'package:flutter/material.dart';

import 'color_apps.dart';

class ButtonAppsStyle{
  // this constructor prevents instantiation and extension.
  ButtonAppsStyle._();

  static ButtonStyle submitButton(){
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 70),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),)
      ),
      primary: ColorApps.primaryColor,
      shadowColor: Colors.white,
    );
  }
}

