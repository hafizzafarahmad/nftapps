import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/core/widget/app_bar.dart';

import '../../../../core/platform/scroll_behavior.dart';

class ProfilePage extends StatefulWidget {
  final bool isMyProfile;
  const ProfilePage({Key? key, required this.isMyProfile}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Avatar and Background
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: SizeApps.height(context, size: 0.09)),
                    height: SizeApps.height(context, size: 0.2),
                    width: SizeApps.width(context, size: 1),
                    child: Image.asset("assets/profile/bg.png",
                      fit: BoxFit.fill,),
                  ),
                  Positioned(
                    bottom: 0,
                    left: SizeApps.width(context, size: 0.5) - 70, //make it center and dynamic avatar size
                    right: SizeApps.width(context, size: 0.5) - 70, //make it center and dynamic avatar size
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset("assets/profile/avatar.png",
                        fit: BoxFit.fill,),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15,),
              const Text("Gift Habeshaw",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("52fs5ge5g45sov45a",
                    style: TextStyle(
                        fontSize: 13,
                      color: Colors.black54
                    ),
                  ),
                  const SizedBox(width: 5,),
                   GestureDetector(
                    onTap: (){
                      // function copy clipboard here
                    },
                    child: const Icon(FontAwesomeIcons.copy, size: 14, color: Colors.grey,),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
