import 'package:flutter/material.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:news_api/view/tabbar.dart';
import 'package:provider/provider.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  List<Widget> Screen = [
    tabbar(),
    Center(child: Text("video screen",style: TextStyle(color: Colors.white,fontSize: 20),)),
    Center(child: Text("setting screen",style: TextStyle(color: Colors.white,fontSize: 20),))
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      body: Screen[Provider.of<homeProvider>(context, listen: true).index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int cindex) {
            Provider.of<homeProvider>(context, listen: false)
                .currentindex(cindex);
          },
          currentIndex: Provider.of<homeProvider>(context).index,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.play_circle_outline,
                ),
                label: "video"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "profile"),
          ]),
    ));
  }
}
