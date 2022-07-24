import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/features/auction/presentation/page/auction_page.dart';
import 'package:nftapps/features/discover%20creator/presentation/page/discover_creator_page.dart';
import 'package:nftapps/features/discover%20items/presentation/page/discover_items_page.dart';
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
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: <Widget> [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                color: Colors.red,
                                border: Border.all(color: Colors.red)
                            ),
                          ),
                          const SizedBox(width: 15,),
                          const Text(
                            "Live Auction",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const <Widget> [
                          Icon(FontAwesomeIcons.imagePortrait, size: 15, ),
                          SizedBox(width: 10,),
                          Text(
                            "Discover Creator",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: const <Widget> [
                          Icon(FontAwesomeIcons.searchengin, size: 15, ),
                          SizedBox(width: 10,),
                          Text(
                            "Discover Item",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: const <Widget> [
                          Icon(FontAwesomeIcons.gear, size: 15, ),
                          SizedBox(width: 10,),
                          Text(
                            "Setting",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Row(
                        children: const <Widget> [
                          Icon(FontAwesomeIcons.arrowRightFromBracket, size: 15, color: Colors.red,),
                          SizedBox(width: 10,),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  icon: const Icon(Icons.menu, size: 25, ),
                  offset: const Offset(-40, 10),
                  onSelected: (value){
                    if(value == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AuctionPage()));
                    } else if (value == 1){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoverCreatorPage()));
                    } else if (value == 2){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoverItemsPage()));
                    }

                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  static PreferredSizeWidget plainAppBar({required IconData icons, required BuildContext context, required String name}){
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
            Row(
              children: [
                Icon(icons, size: 20,),
                const SizedBox(width: 10,),
                Text(name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
