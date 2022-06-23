import 'package:flutter/material.dart';

import '../styles/size_apps.dart';
import 'button_widget.dart';

Widget footer(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
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
    ],
  );
}