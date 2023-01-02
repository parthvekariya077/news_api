import 'package:flutter/material.dart';
import 'package:news_api/model/Countryapi.dart';
import 'package:news_api/model/newsmodal.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class India extends StatefulWidget {
  const India({Key? key}) : super(key: key);

  @override
  State<India> createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Countryapi>(
        future: Provider.of<homeProvider>(context,listen: false).cApiCalling("${Provider.of<homeProvider>(context,listen: true).country}"),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text("${snapshot.error}");
          }else if(snapshot.hasError){
            Countryapi countryapi = snapshot.data!;
            return ListView.builder(
              itemCount: countryapi.articles!.length,
                itemBuilder: (context,index){
                return Column(
                  children: [
                    Text("${countryapi.articles![index].title}"),
                    Text("${countryapi.articles![index].publishedAt}"),
                  ],
                );
            });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
