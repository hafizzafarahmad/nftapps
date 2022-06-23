import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/styles/size_apps.dart';
import 'package:nftapps/core/widget/button_widget.dart';
import 'package:nftapps/core/widget/footer.dart';
import 'package:nftapps/features/home/presentation/widget/hot_bid_widget.dart';
import 'package:nftapps/features/home/presentation/widget/hot_collection_widget.dart';

import '../../../core/styles/color_apps.dart';
import '../../../core/styles/input_apps_style.dart';
import '../../../core/widget/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final TextEditingController _searchInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  appBar(),
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(), //to disable scroll shadow
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text("Discover, collect, and sell",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54
                      ),
                    ),
                    const SizedBox(height: 3,),
                    const Text("Your Digital Art",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
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



                  ],
                ),
              ),

              ///Hot bid
              hotBidWidget(context),
              const SizedBox(height: 30,),

              ///Hot Collection
              hotCollectionWidget(context),
              const SizedBox(height: 30,),
              const Divider(thickness: 1,),
              const SizedBox(height: 50,),

              ///footer
              footer(context),

              const SizedBox(height: 70,),
            ],
          )
        ),
      ),
    );
  }
}
