import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widget/button_widget.dart';

Widget hotBidWidget(BuildContext context){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(FontAwesomeIcons.fire, color: Colors.deepOrangeAccent,),
                SizedBox(width: 5,),
                Text("Hot bid",
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
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, top: 10),
        height: 340,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 230,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                children: [
                  Image.asset("assets/bid/bid1.png", height: 280, fit: BoxFit.fill,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text("Inside Kings Cross",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: const Text("2.3 ETH",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 3,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Highest bid",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: " 1.00ETH",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 230,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                children: [
                  Image.asset("assets/bid/bid2.png", height: 280, fit: BoxFit.fill,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text("Inside Kings Cross",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: const Text("2.3 ETH",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 3,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Highest bid",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: " 1.00ETH",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    ],
  );
}