import 'package:flutter/material.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/widget/footer.dart';
import 'package:nftapps/features/home/presentation/widget/hot_bid_widget.dart';
import 'package:nftapps/features/home/presentation/widget/hot_collection_widget.dart';

import '../../../../core/styles/input_apps_style.dart';
import '../../../../core/widget/app_bar.dart';

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
    //dispose controller to prevent memory leaks
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //get appbar widget from core > widget
      appBar:  AppBarWidget.mainAppBar( context: context),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
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

              //Hot bid
              //get hotBidWidget from home > presentation > widget
              hotBidWidget(context),
              const SizedBox(height: 30,),

              //Hot Collection
              //get hotCollectionWidget from home > presentation > widget
              hotCollectionWidget(context),
              const SizedBox(height: 30,),
              //footer
              //get footer widget from core > widget
              footer(context),
            ],
          )
        ),
      ),
    );
  }
}
