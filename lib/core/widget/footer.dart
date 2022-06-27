import 'package:flutter/material.dart';

import '../styles/size_apps.dart';
import 'button_widget.dart';

//footer customize here
Widget footer(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Divider(thickness: 1,),
      const SizedBox(height: 50,),
      const Text("The New Creative Economy",
        style: TextStyle(
            fontSize: 25,
            color: Colors.black54
        ),
      ),
      const SizedBox(height: 20,),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: SizeApps.width(context, size: 1),
        child: ButtonWidget.submit(text: "Earn now", fontSize: 18),
      ),
      const SizedBox(height: 10,),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: SizeApps.width(context, size: 1),
        child: ButtonWidget.light(text: "Discover more", fontSize: 18),
      ),
      const SizedBox(height: 70,),
    ],
  );
}