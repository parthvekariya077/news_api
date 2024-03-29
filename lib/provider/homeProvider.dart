// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/model/Countryapi.dart';

class homeProvider extends ChangeNotifier {
  String country = "in";

  int index = 0;

  void currentIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changeCountry(String c1) {
    country = c1;
    notifyListeners();
  }

  Future<Countryapi> cApiCalling(String data) async {
    String countryApi =
        "https://newsapi.org/v2/top-headlines?country=$data&category=business&apiKey=a1cf1d9413f8435a98e9cca38397ae2f";

    var jsonString = await http.get(Uri.parse(countryApi));
    var json = jsonDecode(jsonString.body);

    return Countryapi.fromJson(json);
  }
}
