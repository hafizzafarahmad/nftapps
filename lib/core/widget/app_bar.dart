import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/features/notification/presentation/page/notification_page.dart';
import 'package:nftapps/features/profile/presentation/page/profile_page.dart';

//app bar customize here
class AppBarWidget{
  // this constructor prevents instantiation and extension.
  AppBarWidget._();

  static PreferredSizeWidget mainAppBar({required BuildContext context}){
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
                    onPressed: (){
                      //Navigate to Notification Page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                    },
                    icon: const Icon(FontAwesomeIcons.bell, size: 23,)
                ),
                IconButton(
                    onPressed: (){
                      //Navigate to Profile Page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(isMyProfile: true,)));
                    },
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
  static PreferredSizeWidget plainAppBar({required BuildContext context}){
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 30, left: 5, right: 15),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(FontAwesomeIcons.angleLeft, size: 23,)
            ),
          ],
        ),
      ),
    );
  }
}
