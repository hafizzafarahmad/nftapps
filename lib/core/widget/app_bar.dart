import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget appBar(){
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Container(
      height: 100,
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("nft",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Image.asset("assets/art.PNG", width: 80, )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(FontAwesomeIcons.bell, size: 23,)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(FontAwesomeIcons.user, size: 22,)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.menu, size: 27,)
              )
            ],
          )
        ],
      ),
    ),
  );
}