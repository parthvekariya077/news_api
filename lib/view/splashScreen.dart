import 'dart:async';

import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  List img=["assets/gif/gif.gif"];
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10),(){
      Navigator.pushReplacementNamed(context, 'bottom');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset("assets/gif/gif.gif"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}