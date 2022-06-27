import 'package:flutter/material.dart';
import 'package:nftapps/core/platform/scroll_behavior.dart';
import 'package:nftapps/core/widget/app_bar.dart';

class DetailAuctionPage extends StatefulWidget {
  final bool isSold;
  final String image;
  const DetailAuctionPage({Key? key, required this.isSold, required this.image}) : super(key: key);

  @override
  State<DetailAuctionPage> createState() => _DetailAuctionPageState();
}

class _DetailAuctionPageState extends State<DetailAuctionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //get appbar widget from core > widget
      appBar: AppBarWidget.plainAppBar(context: context),
      body: ScrollConfiguration(
        //to disable scroll shadow
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(),
        ),
      ),
    );
  }
}
