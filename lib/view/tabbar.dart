import 'package:flutter/material.dart';
import 'package:news_api/view/home.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Daily24/7 News"),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("Setting")),
                PopupMenuItem(child: Text("Add Profile")),
              ];
            }),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(text: "TOP NEWS"),
              Tab(text: "HEALTH"),
              Tab(text: "BISSNESS"),
              Tab(text: "ENTERTAIMENTS"),
              Tab(text: "SCIENCE"),
              Tab(text: "SPORTS"),
              Tab(text: "TECHNOLOGY"),
              Tab(text: "ORIGINAL"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyApp(),
            MyApp(),
            MyApp(),
            MyApp(),
            MyApp(),
            MyApp(),
            MyApp(),
          ],
        ),
      )),
    );
  }
}
