import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/model/Countryapi.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  homeProvider? hpfalse;
  homeProvider? hptrue;

  @override
  Widget build(BuildContext context) {
    hpfalse = Provider.of<homeProvider>(context, listen: false);
    hptrue = Provider.of<homeProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: Provider.of<homeProvider>(context, listen: false).cApiCalling(
              "${Provider.of<homeProvider>(context, listen: true).country}"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              Countryapi countryapi = snapshot.data!;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Country name",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'imagescreen');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            child: const Text("Show")),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: countryapi.articles!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'detail');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "${countryapi.articles![index].title}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 30),
                                      ),
                                      CachedNetworkImage(
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            "${countryapi.articles![index].urlToImage}",
                                        placeholder: (context, _) =>
                                            const Center(
                                                child: Text("ERROR LOADING!")),
                                        errorWidget: (context, _, __) =>
                                            const Center(
                                                child: Text("ERROR LOADING!")),
                                      ),
                                      Text(
                                        "${countryapi.articles![index].description}",
                                        style:
                                            const TextStyle(color: Colors.teal),
                                      ),
                                      Text(
                                        "${countryapi.articles![index].content}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    ));
  }
}
