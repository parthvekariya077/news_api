import 'package:flutter/material.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:news_api/view/bottomNavigation.dart';
import 'package:news_api/view/detailsScreen.dart';
import 'package:news_api/view/home.dart';
import 'package:news_api/view/image.dart';
import 'package:news_api/view/india.dart';
import 'package:news_api/view/splashScreen.dart';
import 'package:news_api/view/tabbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<homeProvider>(create: ((context)=> homeProvider()))
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SpleshScreen(),
        'bottom':(context) => bottom(),
        'tabbar':(context) => tabbar(),
        'splashscreen':(context) => SpleshScreen(),
        'myapp':(context) => MyApp(),
        'detail':(context) => detailsScreen(),
        'imagescreen':(context) => ImageScreen(),
        'india':(context) => India(),
      },
    ),
  ));
}
