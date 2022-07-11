import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/features/auction/presentation/page/detail_auction_page.dart';

import '../../../../core/widget/profile_snippet.dart';

class ItemListAuctionWidget extends StatelessWidget {
  final bool isSold;
  final String image;
  const ItemListAuctionWidget({Key? key,
    required this.isSold,
    required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //navigate to detail auction widget
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAuctionPage(
          isSold: isSold,
          image: image,
        )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(image,
                        height: SizeApps.width(context, size: 1) + 50,
                        width: SizeApps.width(context, size: 1),
                        fit: BoxFit.fill,),
                      const SizedBox(height: 10,),
                      const Text("Silent Color",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //get profile snippet from directory core > widget
                          profileSnippet(),
                          //get ButtonWidget from directory core > widget
                          const Icon(FontAwesomeIcons.heart)
                        ],
                      ),

                    ],
                  ),
                )
            ),
            isSold ?
            //if status sold
            Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Sold For",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black45,
                            ),
                          ),
                          TextSpan(
                            text: " 2.00ETH",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                            ),
                          )
                        ]
                    ),
                  ),
                )
            ) :
            //if status !sold
            Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text("Current bid",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),
                            ),
                            Text(
                              "2.00ETH",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Ending in",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),
                            ),
                            Text(
                              "27m 30s",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
