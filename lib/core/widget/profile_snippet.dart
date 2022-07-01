import 'package:flutter/material.dart';

//profile snippet customize here
Widget profileSnippet(){
  return Container(
    height: 35,
    alignment: Alignment.center,
    child: Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Image.asset("assets/profile/avatar.png",
                height: 35,
                width: 35,
                fit: BoxFit.fill,),
            ),
            //Green Dot (status online)
            Positioned(
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: Colors.green,
                    border: Border.all(color: Colors.white)
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Gift Habeshaw",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text("Creator",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black45
              ),
            ),
          ],
        )
      ],
    ),
  );
}