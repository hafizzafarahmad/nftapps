import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/widget/app_bar.dart';
import 'package:nftapps/core/widget/button_widget.dart';
import 'package:nftapps/core/widget/footer.dart';

import '../../../../core/styles/size_apps.dart';
import '../../../../core/widget/profile_snippet.dart';

class DetailAuctionPage extends StatefulWidget {
  final bool isSold;
  final String image;
  const DetailAuctionPage({Key? key, required this.isSold, required this.image}) : super(key: key);

  @override
  State<DetailAuctionPage> createState() => _DetailAuctionPageState();
}

class _DetailAuctionPageState extends State<DetailAuctionPage> {

  List<String> tags = [
    "#color",
    "#circle",
    "#black",
    "#art"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.image, name: "Silent Color"),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.image,
                  height: SizeApps.width(context, size: 1) + 50,
                  width: SizeApps.width(context, size: 1),
                  fit: BoxFit.fill,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Silent Color",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  //get ButtonWidget from directory core > widget
                    Row(
                      children:  [
                        //Button Like
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          onTap: (){},
                          child: const Icon(FontAwesomeIcons.heart),
                        ),
                        const SizedBox(width: 20,),
                        //Button Share
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          onTap: (){},
                          child: const Icon(Icons.share_outlined),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),

                //get profile snippet from directory core > widget
                profileSnippet(),
                const SizedBox(height: 10,),

                //Description
                const Text("Together with my design team, we designed this futuristic "
                    "Cyberyacht concept artwork. We wanted to create something that has "
                    "not been created yet, so we started to collect ideas of how we imagine "
                    "the Cyberyacht could look like in the future.",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black54
                  ),
                ),
                const SizedBox(height: 10,),

                //Tag List
                Wrap(
                  spacing: 5, //Horizontal
                  runSpacing: 5, //Vertical
                  //Generate Chip from variable List<String> tags
                  children: List.generate(tags.length, (index) =>
                    Chip(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.black12),
                      label: Text(
                        tags[index],
                        style: const TextStyle(
                          color: Colors.black45
                        ),
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 20,),

                //View more detail in new page
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: const [
                              Icon(Icons.bar_chart_outlined, size: 25,),
                              SizedBox(width: 10,),
                              Text("View on Etherscan",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          onTap: (){},
                          child: const Icon(Icons.open_in_new, color: Colors.grey,),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star_border, size: 25,),
                            SizedBox(width: 10,),
                            Text("View on IPFS",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          onTap: (){},
                          child: const Icon(Icons.open_in_new, color: Colors.grey,),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.pie_chart_outline, size: 25,),
                            SizedBox(width: 10,),
                            Text("View IPFS Metadata",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          onTap: (){},
                          child: const Icon(Icons.open_in_new, color: Colors.grey,),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                //Sold Information
                widget.isSold ?
                //if status Sold
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    height: 120,
                    width: SizeApps.width(context, size: 1),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Sold For ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: " 2.00ETH",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                                TextSpan(
                                  text: " \$2,683.73",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45
                                  ),
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            const Text("Owner by",
                              style: TextStyle(
                                  fontSize: 20,

                              ),
                            ),
                            const SizedBox(width: 10,),
                            profileSnippet(),
                          ],
                        )
                      ],
                    ),
                  ),
                ) :

                //if status Available
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    height: 250,
                    width: SizeApps.width(context, size: 1),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Current Bid",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54
                          ),
                        ),
                        const SizedBox(height: 5,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "2.00ETH ",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                                TextSpan(
                                  text: " \$2,683.73",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45
                                  ),
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Auction ending in",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:  [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("12",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                 Text("hours",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("30",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text("minutes",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("25",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text("seconds",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: SizeApps.width(context, size: 1),
                          child: ButtonWidget.submit(
                              text: "Place a bid"
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                //Activity
                const Text("Activity",
                  style: TextStyle(
                      fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20,),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            profileSnippet(),
                            InkWell(
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                              onTap: (){},
                              child: const Icon(Icons.open_in_new, color: Colors.grey,),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: " 2.00ETH",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    TextSpan(
                                      text: " \$2,683.73",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text("June 06, 2021 at 12:00am",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                ),

                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profileSnippet(),
                              InkWell(
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                onTap: (){},
                                child: const Icon(Icons.open_in_new, color: Colors.grey,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: " 2.00ETH",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                      TextSpan(
                                        text: " \$2,683.73",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45
                                        ),
                                      )
                                    ]
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text("June 06, 2021 at 12:00am",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black45
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ),
                const SizedBox(height: 50,),

                //footer
                //get footer widget from core > widget
                footer(context),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
