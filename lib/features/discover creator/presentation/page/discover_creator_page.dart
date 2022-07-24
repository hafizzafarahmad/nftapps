import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/styles/size_apps.dart';

import '../../../../core/styles/input_apps_style.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/footer.dart';
import '../widget/item_list_discover_creator_widget.dart';

class DiscoverCreatorPage extends StatefulWidget {
  const DiscoverCreatorPage({Key? key}) : super(key: key);

  @override
  State<DiscoverCreatorPage> createState() => _DiscoverCreatorPageState();
}

class _DiscoverCreatorPageState extends State<DiscoverCreatorPage> {

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
      appBar: AppBarWidget.plainAppBar(context: context, icons: FontAwesomeIcons.searchengin, name: "Search"),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        //this scroll is the root of this page
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Header
                const Text("Discover Creator",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: SizeApps.width(context, size: 0.6),
                  child: const Text("Follow at least five creators to build your feed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

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
                    ItemListDiscoverCreatorWidget(isSold: true, image: "assets/auction/auction1.png",),
                    ItemListDiscoverCreatorWidget(isSold: false, image: "assets/auction/auction2.png",)
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
