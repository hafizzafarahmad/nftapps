import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/core/widget/app_bar.dart';
import 'package:nftapps/core/widget/button_widget.dart';

import '../../../../core/platform/scroll_behavior.dart';
import '../../../../core/widget/footer.dart';
import 'edit_profile_page.dart';

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
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.user, name: "My Profile"),
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
              //Full Name
              const Text("Gift Habeshaw",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5,),
              //ID
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Following
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       Text("285",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                       Text("Following",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  //Follower
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("2024",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Followers",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  //Edit Profile
                  ButtonWidget.light(
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                    },
                    text: "Edit Profile"
                  )
                ],
              ),
              const SizedBox(height: 30,),
              const Text("Member since  2021",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              const SizedBox(height: 70,),


              SizedBox(
                width: SizeApps.width(context, size: 0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Your collection is empty.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Start building your collection by placing bids on artwork.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70,),

              //footer
              //get footer widget from core > widget
              footer(context),
            ],
          ),
        ),
      ),
    );
  }
}
