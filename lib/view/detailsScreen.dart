import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/model/Countryapi.dart';
import 'package:news_api/model/newsmodal.dart';
import 'package:news_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class detailsScreen extends StatefulWidget {
  const detailsScreen({Key? key}) : super(key: key);

  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
            body: FutureBuilder(
                future: Provider.of<homeProvider>(context, listen: false)
                    .cApiCalling("${Provider.of<homeProvider>(context,listen: true).country}"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    Countryapi countryapi = snapshot.data!;
                    return ListView.builder(
                        itemCount: countryapi.articles?.length,
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
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 30),
                                      ),
                                      CachedNetworkImage(
                                        imageUrl:
                                        "${countryapi.articles![index].urlToImage}",
                                        placeholder: (context, _) => Center(
                                          child: Text("ERROR LOADING"),
                                        ),
                                        errorWidget: (context, _, __) => Center(
                                          child: Text("ERROR LOADING"),
                                        ),
                                      ),
                                      Text(
                                        "${countryapi.articles![index].description}",
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                      Text(""),
                                      Text(
                                        "${countryapi.articles![index].content}",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                })
            // FutureBuilder(
            //   future: Provider.of<homeProvider>(context, listen: false).apicalling(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text("${snapshot.error}");
            //     } else if (snapshot.hasData) ;
            //     {
            //       Newsmodal newsmodal = snapshot.data!;
            //
            //       return ListView.builder(
            //           itemCount: newsmodal.articles!.length,
            //           itemBuilder: (context, index) {
            //             return Card(
            //               child: Container(
            //                 child: Column(
            //                   children: [
            //                     Text(
            //                       "${newsmodal.articles![index].title}",
            //                       overflow: TextOverflow.ellipsis,
            //                       style: TextStyle(color: Colors.red, fontSize: 30),
            //                     ),
            //                     Image.network(
            //                         "${newsmodal.articles![index].urlToImage}"),
            //                     Text(
            //                       "${newsmodal.articles![index].description}",
            //                       style: TextStyle(color: Colors.teal),
            //                     ),
            //                     Text(""),
            //                     Text(
            //                       "${newsmodal.articles![index].content}",
            //                       overflow: TextOverflow.ellipsis,
            //                       style: TextStyle(color: Colors.deepOrange),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           });
            //     }
            //   },
            // ),
            ));
  }
}
