
import 'package:flutter/material.dart';
import 'package:thesisproject/Utils/RecommendationImage.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  Map data;
  List trendingNews = [];
  List list;
  Future getData() async {
    String url1 =
        "http://127.0.0.1:8080/apibdaya/api/news"; //"https://lifei.id/api/news/budaya";
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
    this.getData();
    tabController = new TabController(length: 1, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("B-Daya News", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Scaffold(
        backgroundColor: kwhite,
        appBar: TabBar(
          labelColor: kdarkBlue,
          labelStyle:
          TextStyle(fontFamily: "nunito", fontWeight: FontWeight.bold),
          controller: tabController,
          indicatorColor: kdarkBlue,
          tabs: <Widget>[
            Tab(text: "Culture"),
//            Tab(text: "Hotels"),
//            Tab(text: "Deliveries"),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top : 10.0, bottom: 10.0),
              child: ListView.builder(
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
                                      'assets/images/imgPlaceholder.png',
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
                                    String news = trendingNews[i]['url'];
                                    _launchNews(news);
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
            ),
//            SingleChildScrollView(
//              child: Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        BoldText("Current order", 20.0, kblack),
//                        BoldText("More", 16, kdarkBlue),
//                      ],
//                    ),
//                    SizedBox(height: 16,),
//                    Container(
//                      width: MediaQuery.of(context).size.width-80,
//                      height: 250,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            width:MediaQuery.of(context).size.width-80,
//                            height: 200.0,
//                            child: ClipRRect(
//                                borderRadius: new BorderRadius.all(
//                                  Radius.circular(15),
//                                ),
//                                child: Image.asset(
//                                  "assets/images/sheraton.jpg",
//                                  fit: BoxFit.fitHeight,
//                                )),
//                          ),
//                          BoldText("sheraton", 20.0, kblack),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              NormalText("Oran", kgreyDark, 12.0),
//                              Icon(
//                                Icons.location_on,
//                                color: kgreyDark,
//                                size: 16.0,
//                              )
//                            ],
//                          )
//                        ],
//                      ),
//                    ),
//                    SizedBox(height: 10.0,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        BoldText("Past order", 20.0, kblack),
//                        BoldText("More", 16, kdarkBlue),
//                      ],
//                    ),
//                    SizedBox(height: 10.0,),
//                    Container(
//                      width: 400,
//                      height: 200,
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          RecommendationImage("assets/images/sheraton.jpg", "Sheraton", "Oran"),
//                          RecommendationImage("assets/images/Meridien.jpg", "Meridien", "Oran"),
//                          RecommendationImage("assets/images/ibis.jpg", "Ibis", "Oran"),
//                        ],
//                      ),
//                    ),
//
//                  ],
//                ),
//              ),
//            ),
//            Icon(Icons.restaurant),
          ],
          controller: tabController,
        ),
      ),
    );
  }
  void _launchNews(String news) async {
    final url = news;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}