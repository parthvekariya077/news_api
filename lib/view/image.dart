import 'package:flutter/material.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List images = [
    "assets/image/argentina.png",
    "assets/image/australia.png",
    "assets/image/austria.png",
    "assets/image/belgium.png",
    "assets/image/brazil.png",
    "assets/image/bulgaria.png",
    "assets/image/canada.png",
    "assets/image/china.png",
    "assets/image/colombia.png",
    "assets/image/cuba.png",
    "assets/image/czech republic.png",
    "assets/image/france.png",
    "assets/image/germany.png",
    "assets/image/greece.png",
    "assets/image/hong kong.png",
    "assets/image/hungary.png",
    "assets/image/india.png",
    "assets/image/ireland.png",
    "assets/image/japan.png",
    "assets/image/moroco.png",
    "assets/image/norway.png",
    "assets/image/philippines.png",
    "assets/image/portugal.png",
    "assets/image/russia.png",
    "assets/image/singapore.png",
    "assets/image/switzerland.png",
    "assets/image/taiwan.png",
    "assets/image/thailand.png",
    "assets/image/turkey.png",
    "assets/image/uk.png",
    "assets/image/ukraine.png",
    "assets/image/us.png",
  ];
  List countryname = [
    "argentina",
    "australia",
    "austria",
    "belgium",
    "brazil",
    "bulgaria",
    "canada",
    "china",
    "colombia",
    "cuba",
    "czech republic",
    "france",
    "germany",
    "greece",
    "hong kong",
    "hungary",
    "india",
    "ireland",
    "japan",
    "moroco",
    "norway",
    "philippines",
    "portugal",
    "russia",
    "singapore",
    "switzerland",
    "taiwan",
    "thailand",
    "turkey",
    "uk",
    "ukraine",
    "us"
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Flag("in"),
    ));
  }
  Widget Flag(String data){
    return GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: GestureDetector(
              onTap: (){
                Provider.of<homeProvider>(context,listen: false).changeCountry(data);
                Navigator.pushNamed(context, 'bottom');
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(child: Image.asset("${images[index]}")),
                    Text(
                      "${countryname[index]}",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
