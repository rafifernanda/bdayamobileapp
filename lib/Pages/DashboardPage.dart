import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thesisproject/Maps/screens/search.dart';
import 'package:thesisproject/Pages/List_Bali.dart';
import 'package:thesisproject/Pages/List_Culture.dart';
import 'package:thesisproject/Pages/List_Jawa.dart';
import 'package:thesisproject/Pages/List_Kalimantan.dart';
import 'package:thesisproject/Pages/List_Maluku.dart';
import 'package:thesisproject/Pages/List_Nusa.dart';
import 'package:thesisproject/Pages/List_Papua.dart';
import 'package:thesisproject/Pages/List_Sumatra.dart';
import 'package:thesisproject/Pages/Routes_Widget.dart';
import 'package:thesisproject/Utils/BestRatedImage.dart';
import 'package:thesisproject/Utils/CitiesImage.dart';
import 'package:thesisproject/Utils/RecommendationImage.dart';
import 'package:thesisproject/Utils/Buttons.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/ImageContainer.dart';
import 'package:thesisproject/main.dart';

import 'OverViewScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageContainer(),
            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),

              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BoldText("Visit Your Nearby Cultural Places !", 14.0, Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left:16.0,right: 16.0,bottom: 16.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: WideButton(
                      "NEARBY",
                          () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return MyApp();
                              }));
                      },
                    ),
                  ),
                ),
//                Padding(
//                  padding: const EdgeInsets.only(bottom: 16.0),
//                  child: Align(
//                      alignment: Alignment.centerLeft,
//                      child: BoldText("Daily Offers", 20.0, kblack)),
//                ),
//                Container(
//                  width: 330,
//                  height: 150,
//                  child: ListView(
//                    scrollDirection: Axis.horizontal,
//                    children: <Widget>[
//                      buildContainer(),
//                      SizedBox(
//                        width: 20,
//                      ),
//                      buildContainer(),
//                      SizedBox(
//                        width: 20,
//                      ),
//                      buildContainer(),
//                    ],
//                  ),
//                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Recommended for you", 20.0, kblack),
                      SizedBox(
                        width: 60,
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return List_Culture();
                            }));
                          },
                          child: BoldText("More", 15.0, korange)),
                      Icon(
                        Icons.navigate_next,
                        color: korange,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return List_Jawa();
                            }));
                          },
                          child: RecommendationImage("assets/images/Jawa.jpg", "Jawa", "Yogyakarta")),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return List_Sumatra();
                            }));
                          },
                          child: RecommendationImage("assets/images/Sumbar.jpg", "Sumatra", "Aceh")),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return List_Nusa();
                            }));
                          },
                          child: RecommendationImage("assets/images/Nusa.jpg", "Nusa", "Flores")),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return List_Maluku();
                            }));
                          },
                          child: RecommendationImage("assets/images/Maluku.png", "Maluku", "Ambon")),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 10,bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Most Clicked", 20.0, kblack)),
                ),
                Container(
                  width: 400,
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Bali();
                          }));
                        },
                        child: BestRatedImage(
                            "assets/images/Bali.jpg", "Bali", "Kuta", 4.9),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Papua();
                          }));
                        },
                        child: BestRatedImage(
                            "assets/images/Papua.jpg", "Papua", "Asmat", 4.5),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Sumatra();
                          }));
                        },
                        child: BestRatedImage(
                            "assets/images/Sumbar.jpg", "Sumatra", "Padang", 3.1),
                      ),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Culture", 20.0, kblack),
                      SizedBox(
                        width: 60,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Culture();
                          }));
                        },
                        child: BoldText("More", 15.0, korange),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: korange,
                      ),

                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Jawa();
                          }));
                        },
                        child: CitiesImage("assets/images/Jawa.jpg","JAWA")
                    ),
                    SizedBox(width: 28,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return List_Bali();
                          }));
                        },
                        child: CitiesImage("assets/images/Bali.jpg","BALI")
                    ),


                  ],
                ),
                SizedBox(height: 28,),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return List_Kalimantan();
                        }));
                      },
                      child: CitiesImage("assets/images/Borneo.jpg","BORNEO"),
                    ),
//
                    SizedBox(width: 28,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return List_Papua();
                        }));
                      },
                      child: CitiesImage("assets/images/Papua.jpg","PAPUA"),
                    ),
//

                  ],

                ),

              ]),
            ),
          ],
        ),
      ),
    );
  }



//  Widget buildContainer() {
//    return GestureDetector(
//      onTap: (){
//        Navigator.push(context, MaterialPageRoute(builder: (_) {
//          return List_Jawa();
//        }));
//      },
//      child: Container(
//        width: 320,
//        height: 50,
//        child: Container(
//            width: 300,
//            height: 150,
//            decoration: BoxDecoration(
//                color: Colors.grey.shade50,
//                borderRadius: BorderRadius.circular(15.0)),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                  width: 150,
//                  height: 150,
//                  child: ClipRRect(
//                      borderRadius: new BorderRadius.only(
//                          topLeft: Radius.circular(15),
//                          bottomLeft: Radius.circular(15)),
//                      child: Image.asset(
//                        "assets/images/Jawa.jpg",
//                        fit: BoxFit.fitHeight,
//                      )),
//                ),
//                SizedBox(
//                  width: 10.0,
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    BoldText("Jawa", 20.5, kblack),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        BoldText("5 Stars", 15.0, korangelite),
//                        Icon(
//                          Icons.location_on,
//                          color: kgreyDark,
//                          size: 15.0,
//                        ),
//                        NormalText("Yogya", kgreyDark, 15.0)
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Container(
//                          width: 50.0,
//                          decoration: BoxDecoration(
//                            color: korange,
//                            borderRadius: BorderRadius.circular(10.0),
//                          ),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              Icon(
//                                Icons.star,
//                                color: kwhite,
//                                size: 15.0,
//                              ),
//                              BoldText("4.5", 15.0, kwhite)
//                            ],
//                          ),
//                        ),
//                        SizedBox(
//                          width: 10,
//                        ),
//                        NormalText("(1024 Reviews)", kgreyDark, 11.0),
//                      ],
//                    ),
//                    SizedBox(
//                      height: 30,
//                    ),
//                    BoldText("Book & Save 30% !", 14.0, Colors.red),
//                    SizedBox(height: 14),
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        SizedBox(
//                          width: 90,
//                        ),
//                        BoldText("More", 12.0, kblack),
//                        Icon(
//                          Icons.navigate_next,
//                          size: 15.0,
//                        ),
//                      ],
//                    )
//                  ],
//                )
//              ],
//            )),
//      ),
//    );
//  }

  Row imagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SquaredIcon(Icons.airplanemode_active, "Flights"),
        SquaredIcon(FontAwesomeIcons.hotel, "Hotels"),
        SquaredIcon(Icons.directions_car, "Cars"),
      ],
    );
  }
}