import 'package:flutter/material.dart';
import 'package:nftapps/core/styles/size_apps.dart';


class ItemListNotificationWidget extends StatelessWidget {
  const ItemListNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset("assets/notification/notif1.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,),
                ),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("ETH received",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("ETH received",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("1 day ago",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(thickness: 1,)
          ],
        ),
      ),
    );
  }
}
