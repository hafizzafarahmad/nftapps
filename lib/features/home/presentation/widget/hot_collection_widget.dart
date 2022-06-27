import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/size_apps.dart';

import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/profile_snippet.dart';

//hot collection section customize here
Widget hotCollectionWidget(BuildContext context){

  return Padding(
    padding: const  EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        //Header title and view all
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.stars_rounded, color: Colors.orangeAccent,),
                SizedBox(width: 5,),
                Text("Hot Collection",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            ButtonWidget.light(text: "View All"),
          ],
        ),

        //body list items
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset("assets/collection/col1.png",
                  height: SizeApps.width(context, size: 0.5),
                  width: SizeApps.width(context, size: 0.42),
                  fit: BoxFit.fill,),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset("assets/collection/col2.png",
                  height: SizeApps.width(context, size: 0.5),
                  width: SizeApps.width(context, size: 0.42),
                  fit: BoxFit.fill,),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child:  Image.asset("assets/collection/col3.png",
                  height: SizeApps.width(context, size: 0.5),
                  width: SizeApps.width(context, size: 0.42),
                  fit: BoxFit.fill,),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child:  Image.asset("assets/collection/col4.png",
                  height: SizeApps.width(context, size: 0.5),
                  width: SizeApps.width(context, size: 0.42),
                  fit: BoxFit.fill,),
              ),

            ],
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text("Water and sunflower",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: const Text("30 items",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //get profile snippet from directory core > widget
            profileSnippet(),
            //get ButtonWidget from directory core > widget
            ButtonWidget.light(text: "Follow"),
          ],
        )
      ],
    ),
  );
}