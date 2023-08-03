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
          title: const Text("Daily24/7 News"),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("Setting")),
                const PopupMenuItem(child: Text("Add Profile")),
              ];
            }),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(text: "TOP NEWS"),
              Tab(text: "HEALTH"),
              Tab(text: "BUSINESS"),
              Tab(text: "ENTERTAINMENTS"),
              Tab(text: "SCIENCE"),
              Tab(text: "SPORTS"),
              Tab(text: "TECHNOLOGY"),
              Tab(text: "ORIGINAL"),
            ],
          ),
        ),
        body: const TabBarView(
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
