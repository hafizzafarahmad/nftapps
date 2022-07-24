import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/color_apps.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/core/widget/app_bar.dart';
import 'package:nftapps/core/widget/button_widget.dart';

import '../../../../core/platform/scroll_behavior.dart';
import '../../../../core/styles/input_apps_style.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _usernameInput = TextEditingController();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _bioInput = TextEditingController();

  @override
  void dispose() {
    //dispose controller to prevent memory leaks
    _nameInput.dispose();
    _usernameInput.dispose();
    _emailInput.dispose();
    _bioInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.pencil, name: "Edit Profile"),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  const Text("Upload a profile image.",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: SizeApps.width(context, size: 0.4),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        child: Image.asset("assets/profile/avatar.png",
                          fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),



                  const Text("Enter your details",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //Input Username
                  TextFormField(
                    controller: _nameInput,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Name cannot be blank";
                      }
                      return null;
                    },
                    //get InputAppsStyle from core > styles
                    decoration: InputAppsStyle.textField(hint: "Name"),
                  ),
                  const SizedBox(height: 15,),
                  //Input Username
                  TextFormField(
                    controller: _usernameInput,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username cannot be blank";
                      }
                      return null;
                    },
                    //get InputAppsStyle from core > styles
                    decoration: InputAppsStyle.textField(hint: "Username"),
                  ),
                  const SizedBox(height: 30,),

                  const Text("Enter your email",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //Input Email
                  TextFormField(
                    controller: _emailInput,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email cannot be blank";
                      }
                      return null;
                    },
                    //get InputAppsStyle from core > styles
                    decoration: InputAppsStyle.textField(hint: "Email"),
                  ),
                  const SizedBox(height: 5,),
                  const Text("Add your email address to receive notifications about your activity on Foundation. "
                      "This will not be shown on your profile.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 30,),

                  const Text("Enter your bio",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 15,),
                  //Input Description
                  TextFormField(
                    controller: _bioInput,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Description cannot be blank";
                      }
                      return null;
                    },
                    //get InputAppsStyle from core > styles
                    decoration: InputAppsStyle.textField(hint: "Description"),
                  ),
                  const SizedBox(height: 30,),

                  const Text("Add links to your social media profiles.",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ///get button widget from core > widget
                  //Instagram
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.instagram, color: ColorApps.primaryColor,),
                        text: "Instagram", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Discord
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.discord, color: ColorApps.primaryColor,),
                        text: "Discord", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Facebook
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.facebook, color: ColorApps.primaryColor,),
                        text: "Facebook", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Twitter
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.twitter, color: ColorApps.primaryColor,),
                        text: "Twitter", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Youtube
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.youtube, color: ColorApps.primaryColor,),
                        text: "Youtube", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Twitch
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.twitch, color: ColorApps.primaryColor,),
                        text: "Twitch", fontSize: 18),
                  ),
                  const SizedBox(height: 10,),
                  //Tiktok
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.linkSocial(icon: Icon(FontAwesomeIcons.tiktok, color: ColorApps.primaryColor,),
                        text: "Tiktok", fontSize: 18),
                  ),
                  const SizedBox(height: 30,),

                  //get button widget from core > widget
                  SizedBox(
                    width: SizeApps.width(context, size: 1),
                    child: ButtonWidget.submit(
                        onPress: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.pop(context);
                          }
                        },
                        text: "Save",
                        fontSize: 18),
                  ),


                  const SizedBox(height: 20,),
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}
