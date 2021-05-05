import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:thesisproject/Utils/consts.dart';

class TestNews extends StatefulWidget {
  @override
  _TestNewsState createState() => _TestNewsState();
}

class _TestNewsState extends State<TestNews> {

  Map data;
  List trendingNews = [];
  List list;
  Future getData() async {
    String url1 =
        "https://newsapi.org/v2/top-headlines?country=in&pagesize=100&apiKey=31ca4832eab448daa762754f150bd3b8";
    http.Response response = await http
        .get(Uri.encodeFull(url1), headers: {"Accept": "application/json"});
    setState(() {
      var trendingJsonData = json.decode(response.body);
      trendingNews = trendingJsonData['articles'];
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
//    checkLoginStatus();
    this.getData();
//    RefreshList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: trendingNews == null ? 0 : trendingNews.length,
        itemBuilder: (_, int i) {
          return Column(
            children: <Widget>[
              Card(
                color: korange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (BuildContext context) =>
//                            ArticleDetail(
//                              articles: trendingNews[i] == null
//                                  ? Text("Loading!")
//                                  : trendingNews[i],
//                            ),
//                      ),
//                    );
                  },
                  title: Container(
                    child: Stack(
                      //   AlignmentDirectional is used to place the text whereever we wanted on the image
                      alignment: AlignmentDirectional(0, 1),

                      children: <Widget>[
                        //  Hero animation
                        Hero(
                          tag: trendingNews[i]['title'],
                          //  FadeinImage is used to get more UX
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: trendingNews[i]['urlToImage'] ==
                                null
                                ? Image.asset(
                              'images/imgPlaceholder.png',
                            ).toString()
                                : trendingNews[i]['urlToImage'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            trendingNews[i]['title'] == null
                                ? Text("Title here").toString()
                                : trendingNews[i]['title']
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                              backgroundColor: Colors.black26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0),
                        child: FlatButton(
                          splashColor: Colors.grey,
                          onPressed: () {
                            //  Navigate the user to articleDetail page when the button is pressed along with passing the data by using constructor methods.
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (BuildContext context) =>
//                                    ArticleDetail(
//                                      articles: trendingNews[i] == null
//                                          ? Text("Loading!")
//                                          : trendingNews[i],
//                                    ),
//                              ),
//                            );
                          },
                          child: Text(
                            "Read More",
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(),
            ],
          );
        },
      ),
    );
  }
}
