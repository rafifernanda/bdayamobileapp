import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/Video_Player.dart';
import 'package:thesisproject/Test/Detail.dart';
import 'package:thesisproject/Utils/Buttons.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/Light_Color.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleDetail extends StatefulWidget {
  List list;
  int index;
  SimpleDetail({this.index,this.list});
  @override
  _SimpleDetailState createState() => _SimpleDetailState();
}

class _SimpleDetailState extends State<SimpleDetail>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    String value = widget.list[widget.index]["image"];
    String location = widget.list[widget.index]["maps"] ;
    String id = widget.list[widget.index]["id"] ;
    String video = widget.list[widget.index]["video"] ;
    String api = widget.list[widget.index]["api"];
    Widget _icon(IconData icon,
        {Color color = LightColor.iconColor,
          double size = 20,
          double padding = 10,
          bool isOutLine = false}) {
      return Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(padding),
        // margin: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13))
        ),
        child: Icon(icon, color: color, size: size),
      );
    }
    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[

          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Hero(
                  tag: 'imageHero',
                  child: Image.network(
                    '${widget.list[widget.index]["image"]}',
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailImage(value: value);
                  }));
                },
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Location"),
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BoldText("${widget.list[widget.index]["nama"]}", 20.0, kblack),
                                Row(
                                  children: <Widget>[
                                    BoldText("Capital", 12.0, korange),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: kgreyDark,
                                      size: 15.0,
                                    ),
                                    NormalText("${widget.list[widget.index]["capital"]}", kgreyDark, 15.0),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText(
                                    "${widget.list[widget.index]["alias"]}", kgreyDark, 16.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText("About this culture", 20.0, kblack),
                                    BoldText("More", 16, kdarkBlue)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText(
                                    "${widget.list[widget.index]["desc"]}", kblack,
                                    12.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    BoldText("equipments", 20.0, kblack),
//                                    BoldText("More", 16, kdarkBlue),
//                                  ],
//                                ),
//                                SizedBox(
//                                  height: 10,
//                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    equipmentsItem(Icons.wifi, "Wi-Fi"),
//                                    equipmentsItem(
//                                        Icons.local_parking, "Parking"),
//                                    equipmentsItem(Icons.pool, "Pool"),
//                                    equipmentsItem(
//                                        Icons.restaurant, "Restaurant"),
//                                  ],
//                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Location", 20.0, kblack),
                                  GestureDetector(
                                    onTap: (){
                                      _launchMapsurl(location);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        "assets/images/indonesia.png",
                                        fit: BoxFit.fill,
                                        height:
                                        MediaQuery.of(context).size.width -
                                            130,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        BoldText("Reviews", 20.0, kblack),
                                        BoldText("See all", 16, kdarkBlue),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child:
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Center(child: BoldText("Coming Soon!", 30.0, kblack)),
                                      ),
                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Container(
//                                          width: 50.0,
//                                          decoration: BoxDecoration(
//                                            color: korange,
//                                            borderRadius:
//                                            BorderRadius.circular(10.0),
//                                          ),
//                                          child: Row(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.center,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.center,
//                                            children: <Widget>[
//                                              Icon(
//                                                Icons.star,
//                                                color: kwhite,
//                                                size: 15.0,
//                                              ),
//                                              BoldText("4.5", 15.0, kwhite),
//                                            ],
//                                          ),
//                                        ),
//                                        SizedBox(
//                                          width: 10,
//                                        ),
//                                        NormalText(
//                                            "(420 reviews)", kgreyDark, 14),
//                                      ],
//                                    ),
//                                    SizedBox(
//                                      height: 16,
//                                    ),
//                                    reviewProfile("Hichem","5.0","05,Mar,2020"),
//                                    reviewProfile("Walid","3.5","17,feb,2020"),
//                                    reviewProfile("kratos","4.0","10,jan,2020"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),

                  /*Stack(
                    children: <Widget>[
                      Image.asset("assets/hotel.jpg"),
                    ],
                  ),*/
                ),
              ),
            ),
          ),
          Positioned(
              top: 580,
              left: 30,
              right: 30,
              child: WideButton(
                "Detail",
                    () {
//                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Detail_App(id:id, video:video, api:api)));
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Detail_App(id:id, video:video, api:api); // Go To Test/Detail.dart
                  }));
                    },
              )),
        ],
      ),
    );
  }
  void _launchMapsurl(String location) async {
//    String location;
    final url = 'https://www.google.com/maps/search/'+location;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget reviewProfile(String name,String review,String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundColor: kgreyDark,
                child: Icon(
                  Icons.person,
                  size: 12,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BoldText(name, 16, kblack)
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: korange,
                borderRadius:
                BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: kwhite,
                    size: 15.0,
                  ),
                  BoldText(review, 15.0, kwhite),
                ],
              ),
            ),
            SizedBox(width: 10,),
            NormalText(date,kgreyDark,12.0)
          ],

        ),
        SizedBox(height: 10,),
        NormalText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",kblack,12.0),
        SizedBox(height: 10,),
      ],
    );
  }

  Column equipmentsItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: kdarkBlue,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
class DetailImage extends StatelessWidget {
  String value;
  DetailImage({this.value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
              tag: 'imageHero',
              child: PhotoView(
                imageProvider: NetworkImage(value),
              )
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}