import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/List_Bali.dart';
import 'package:thesisproject/Pages/List_Jawa.dart';
import 'package:thesisproject/Pages/List_Kalimantan.dart';
import 'package:thesisproject/Pages/List_Maluku.dart';
import 'package:thesisproject/Pages/List_Nusa.dart';
import 'package:thesisproject/Pages/List_Papua.dart';
import 'package:thesisproject/Pages/List_Sulawesi.dart';
import 'package:thesisproject/Pages/List_Sumatra.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/CitiesImage.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:thesisproject/Utils/Light_Color.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

class List_Culture extends StatefulWidget {
  @override
  _List_CultureState createState() => _List_CultureState();
}

class _List_CultureState extends State<List_Culture> {


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
          title: BoldText("Culture", 25, kblack),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                  padding:
                  const EdgeInsets.only(top: 20 ,left: 35.0, right: 16.0, bottom: 16.0),
                  child: Column(children: <Widget>[
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
                                return List_Sumatra();
                              }));
                            },
                            child: CitiesImage("assets/images/Sumbar.jpg","SUMATRA")),

                      ],
                    ),
                    SizedBox(height: 28,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Bali();
                              }));
                            },
                            child: CitiesImage("assets/images/Bali.jpg","BALI")),
                        SizedBox(width: 28,),

                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Kalimantan();
                              }));
                            },
                            child: CitiesImage("assets/images/Borneo.jpg","BORNEO")),

                      ],

                    ),
                    SizedBox(height: 28,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Sulawesi();
                              }));
                            },
                            child: CitiesImage("assets/images/Sulawesi.jpg","SULAWESI")),
                        SizedBox(width: 28,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Nusa();
                              }));
                            },
                            child: CitiesImage("assets/images/Nusa.jpg","NUSA")),

                      ],
                    ),
                    SizedBox(height: 28,),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Maluku();
                              }));
                            },
                            child: CitiesImage("assets/images/Maluku.png","MALUKU")),
                        SizedBox(width: 28,),

                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) {
                                return List_Papua();
                              }));
                            },
                            child: CitiesImage("assets/images/Papua.jpg","PAPUA")),

                      ],

                    ),
                  ])),

            ])
        ),

    );
  }
}
