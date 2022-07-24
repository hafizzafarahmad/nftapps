import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/widget/app_bar.dart';
import 'package:nftapps/features/notification/presentation/widget/item_list_notification_widget.dart';

import '../../../../core/platform/scroll_behavior.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.bell, name: "Notification"),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                // const Text("Notification",
                //   style: TextStyle(
                //       fontSize: 23,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black
                //   ),
                // ),
                // const SizedBox(height: 30,),
                ListView(
                  // disable scroll listview
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 50),
                  shrinkWrap: true,
                  children: const [
                    //get item from presentation > widget
                    ItemListNotificationWidget(),
                    ItemListNotificationWidget(),
                    ItemListNotificationWidget(),
                    ItemListNotificationWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
