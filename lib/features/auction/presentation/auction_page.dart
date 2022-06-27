import 'package:flutter/material.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/features/auction/presentation/widget/item_list_auction_widget.dart';

import '../../../core/styles/input_apps_style.dart';
import '../../../core/widget/app_bar.dart';
import '../../../core/widget/footer.dart';

class AuctionPage extends StatefulWidget {
  const AuctionPage({Key? key}) : super(key: key);

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {

  final TextEditingController _searchInput = TextEditingController();

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
      appBar:  AppBarWidget.mainAppBar(),
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
                  children:  [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          color: Colors.red,
                          border: Border.all(color: Colors.red)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Live Auction",
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
                    ItemListAuctionWidget(isSold: true, image: "assets/auction/auction1.png",),
                    ItemListAuctionWidget(isSold: false, image: "assets/auction/auction2.png",)
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
    );
  }
}
