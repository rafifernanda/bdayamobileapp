import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/OverViewScreen.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/SubCitiesImage.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:thesisproject/Utils/Light_Color.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class List_Kalimantan extends StatefulWidget {
  @override
  _List_KalimantanState createState() => _List_KalimantanState();
}

class _List_KalimantanState extends State<List_Kalimantan> {
  Map data;
  List userData;
  List list;

//  Future<String> getData() async {
//    var response = await http.get(
//        Uri.encodeFull("http://www.layanan.mch.web.id/frontend/web/index.php/layanan"),
//        headers: {
//          "Accept": "application/json"
//        }
//    );
//
//    this.setState(() {
//      data = json.decode(response.body);
//    });
//
//    print(data[0]["nama"]);
//    print(data[1]["nama"]);
//
//    return "Success!";
//  }
  Future getData() async {
    http.Response response = await http.get(
        "http://127.0.0.1:8080/apibdaya/api/kalimantan"); //"http://lifei.id/api/kalimantan/transaksi");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
    print(userData[0]["nama"]);

    return response;
  }

  @override
  void initState() {
    super.initState();
//    checkLoginStatus();
    this.getData();
//    RefreshList();
  }

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
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Icon(icon, color: color, size: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: _icon(Icons.arrow_back_ios,
                color: Colors.black54, size: 15, padding: 12, isOutLine: true),
          ),
          backgroundColor: kwhite,
          title: BoldText("Kalimantan", 25, kblack),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (context, index){
              return Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 25.0, right: 16.0, bottom: 5.0),
                    child: Column(children: <Widget>[
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return SimpleDetail(list: userData, index: index);
                            }));
                          },
                          child: SubCitiesImage("${userData[index]["image"]}", "${userData[index]["nama"]}")),
                      SizedBox(
                        height: 28,
                      ),
//                SubCitiesImage("assets/images/tlemcen.jpg", "SUMATRA"),
//                SizedBox(
//                  height: 28,
//                ),
//                    Row(
//                      children: <Widget>[
//                        CitiesImage("assets/images/adrar.jpg","BALI"),
//                        SizedBox(width: 28,),
//
//                        CitiesImage("assets/images/bedjaia.jpg","BORNEO"),
//
//                      ],
//
//                    ),
//                SubCitiesImage("assets/images/adrar.jpg", "BALI"),
//                SizedBox(
//                  height: 28,
//                ),
//                SubCitiesImage("assets/images/bedjaia.jpg", "BORNEO"),
//                SizedBox(
//                  height: 28,
//                ),
////                    Row(
////                      children: <Widget>[
////                        CitiesImage("assets/images/alger.jpg","SULAWESI"),
////                        SizedBox(width: 28,),
////                        CitiesImage("assets/images/tlemcen.jpg","NUSA"),
////
////                      ],
////                    ),
//                SubCitiesImage("assets/images/alger.jpg", "SULAWESI"),
//                SizedBox(
//                  height: 28,
//                ),
//                SubCitiesImage("assets/images/tlemcen.jpg", "NUSA"),
//                SizedBox(
//                  height: 28,
//                ),
////                    Row(
////                      children: <Widget>[
////                        CitiesImage("assets/images/adrar.jpg","MALUKU"),
////                        SizedBox(width: 28,),
////
////                        CitiesImage("assets/images/bedjaia.jpg","PAPUA"),
////
////                      ],
////
////                    ),
//                SubCitiesImage("assets/images/adrar.jpg", "MALUKU"),
//                SizedBox(
//                  height: 28,
//                ),
//                SubCitiesImage("assets/images/bedjaia.jpg", "PAPUA"),
//                SizedBox(
//                  height: 28,
//                ),
                    ]
                    )
                ),
              ]
              );
            }
        )
    );
  }
}
