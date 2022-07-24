import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/styles/color_apps.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/core/widget/button_widget.dart';

import '../../../../core/styles/input_apps_style.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/footer.dart';
import '../widget/item_list_discover_items_widget.dart';

class DiscoverItemsPage extends StatefulWidget {
  const DiscoverItemsPage({Key? key}) : super(key: key);

  @override
  State<DiscoverItemsPage> createState() => _DiscoverItemsPageState();
}

class _DiscoverItemsPageState extends State<DiscoverItemsPage> {

  final TextEditingController _searchInput = TextEditingController();

  int selectedType = 0;
  int selectedChain = 0;
  int selectedOnSale = 0;

  //List type for filter
  List<String> types = [
    "All items",
    "Game",
    "Video",
    "Animation",
    "Photography"
  ];

  //List chain for filter
  List<String> chains = [
    "Ethereum",
    "Matic",
    "Klaytn",
  ];

  //List on sale for filter
  List<String> onSales = [
    "ETH",
    "WETH",
    "0xBTC",
    "1337",
    "1MT"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //dispose controller to prevent memory leaks
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.searchengin, name: "Search"),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        //this scroll is the root of this page
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                //Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const  [
                    Text("Discover Items",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                ///Search Input
                TextFormField(
                  controller: _searchInput,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.left,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Email cannot be blank";
                    }
                    return null;
                  },
                  decoration: InputAppsStyle.textField(
                      hint: "Search items, collections, and accounts",
                      suffixIcon: const Icon(Icons.search)
                  ),
                ),
                const SizedBox(height: 20,),

                ListView(
                  // disable scroll listview
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 50),
                  shrinkWrap: true,
                  children: const [
                    //get item from presentation > widget
                    ItemListDiscoverItemsWidget(isSold: true, image: "assets/auction/auction1.png",),
                    ItemListDiscoverItemsWidget(isSold: false, image: "assets/auction/auction2.png",)
                  ],
                ),

                //footer
                //get footer widget from core > widget
                footer(context),
              ],
            ),
          ),
        ),
      ),
      //Floating Button For filter
      floatingActionButton: GestureDetector(
        onTap: (){
          //when filer button tapped -> show modal filter
          _modalFilter();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: Offset(1.0, 5.0)
                )
              ]
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.filter, color: ColorApps.primaryColor, size: 18,),
              const SizedBox(width: 10,),
              Text("Filter",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorApps.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      //change here to set position of floating button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  //filter modal
  void _modalFilter(){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
              builder: (BuildContext context, setState){
                return Container(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 450,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                        color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Type List
                        const Text("Type",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Wrap(
                          spacing: 5, //Horizontal
                          runSpacing: 5, //Vertical
                          //Generate Chip from variable List<String> tags
                          children: List.generate(types.length, (index) =>
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedType = index;
                                  });

                                },
                                child: Chip(
                                  backgroundColor: selectedType == index ? ColorApps.primaryColor : ColorApps.lightGrey,
                                  // side: const BorderSide(color: Colors.black12),
                                  label: Text(
                                    types[index],
                                    style: TextStyle(
                                        color: selectedType == index ? Colors.white : Colors.black54
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                        const SizedBox(height: 10,),

                        //Chain
                        const Text("Chain",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Wrap(
                          spacing: 5, //Horizontal
                          runSpacing: 5, //Vertical
                          //Generate Chip from variable List<String> tags
                          children: List.generate(chains.length, (index) =>
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedChain = index;
                                  });

                                },
                                child: Chip(
                                  backgroundColor: selectedChain == index ? ColorApps.primaryColor : ColorApps.lightGrey,
                                  // side: const BorderSide(color: Colors.black12),
                                  label: Text(
                                    chains[index],
                                    style: TextStyle(
                                        color: selectedChain == index ? Colors.white : Colors.black54
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                        const SizedBox(height: 10,),

                        //On Sale In
                        const Text("On Sale In",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Wrap(
                          spacing: 5, //Horizontal
                          runSpacing: 5, //Vertical
                          //Generate Chip from variable List<String> tags
                          children: List.generate(onSales.length, (index) =>
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedOnSale = index;
                                  });

                                },
                                child: Chip(
                                  backgroundColor: selectedOnSale == index ? ColorApps.primaryColor : ColorApps.lightGrey,
                                  // side: const BorderSide(color: Colors.black12),
                                  label: Text(
                                    onSales[index],
                                    style: TextStyle(
                                        color: selectedOnSale == index ? Colors.white : Colors.black54
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                        const SizedBox(height: 20,),

                        //Submit Button
                        SizedBox(
                          width: SizeApps.width(context, size: 1),
                          //get button widget from core > widget
                          child: ButtonWidget.submit(
                              onPress: (){
                                Navigator.pop(context);
                              },

                              text: "Filter"),
                        )
                      ],
                    )
                );
              }
          );
        }
    );
  }

}
