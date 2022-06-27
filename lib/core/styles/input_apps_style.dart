import 'package:flutter/material.dart';

import 'color_apps.dart';

//customize input field
class InputAppsStyle{
  // this constructor prevents instantiation and extension.
  InputAppsStyle._();

  static InputDecoration textField({required String hint, Widget? suffixIcon}){
    return InputDecoration(
        filled: true,
        fillColor: ColorApps.lightGrey,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hint
    );
  }
}

