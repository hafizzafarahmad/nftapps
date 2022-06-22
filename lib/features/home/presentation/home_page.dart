import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          height: 80,
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          color: Colors.orange,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Row(
                children: [
                  const Text("nft",
                    style: TextStyle(
                        fontSize: 23
                    ),
                  ),
                  Image.asset("assets/art.PNG")
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FontAwesomeIcons.bell, size: 23,)
                  ),
                  IconButton(
                    onPressed: (){},
                      icon: const Icon(FontAwesomeIcons.user, size: 22,)
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.menu, size: 27,)
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container()
          ],
        ),
      ),
    );
  }
}
