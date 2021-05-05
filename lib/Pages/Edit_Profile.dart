import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:thesisproject/Utils/Light_Color.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
//import 'package:tryhttplist/detail.dart';
//import 'main.dart';
import 'dart:async';
import 'dart:convert';

import 'package:thesisproject/Utils/consts.dart';

Future<Album> createAlbum(String url, {Map body}) async {
  return http.put(url, body: body).then((http.Response response){
    final int statusCode = response.statusCode;
    if(statusCode < 200 || statusCode > 400 || json == null){
      throw new Exception("Error while fetching data");
    }
    return Album.fromJson(json.decode(response.body));
  });
}

class Album {
  String name;
  String city;
  String ig;

  Album(
      {
        this.name,
        this.city,
        this.ig,
      });

  Album.fromJson(Map<String, dynamic> json) {
    nnameama: json['name'];
    city: json['city'];
    ig: json['ig'];

  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city'] = this.city;
    data['ig'] = this.ig;
    return data;
  }
}

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();

}

class _EditDataState extends State<EditData> {

//  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerIG = TextEditingController();



//  Map data;
//  List userData;
//  List list;
//  Future getData() async{
//    String id = widget.list[widget.index]["id"].toString();
//    http.Response response = await http.get("https://www.layanan.mch.web.id/frontend/web/index.php/layanan/get-view?id="+id);
//    data = json.decode(response.body);
//    setState(() {
//      userData = data["data"];
//    });
//    debugPrint(userData.toString());
//    print(userData);
//    return response;
//  }
//
//  @override
//  void initState(){
//    this.getData();
//  }
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
//    print(data["id_user"]);
//    controllerUser.text=data["id_user"];
    controllerNama.text=widget.list[widget.index]["name"];
    controllerCity.text=widget.list[widget.index]["city"];
    controllerIG.text=widget.list[widget.index]["ig"];
//    print(widget.list[widget.index]["note"]);
    String id = widget.list[widget.index]["username"].toString();
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
        title: BoldText("Edit Information", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
//                TextField(
//                  controller: controllerUser,
//                  decoration: new InputDecoration(
//                      hintText: "User ID",
//                      labelText: "User ID"
//                  ),
//                ),
                TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name"
                  ),
                ),
                TextField(
                  controller: controllerCity,
                  decoration: new InputDecoration(
                      hintText: "City, Country",
                      labelText: "City, Country"
                  ),
                ),
                TextField(
                  controller: controllerIG,
                  decoration: new InputDecoration(
                      hintText: "Instagram username",
                      labelText: "Instagram username"
                  ),
                ),

                RaisedButton(
                  color: korange,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('SAVE', style: TextStyle(fontFamily: 'nunito', color: kwhite, fontWeight: FontWeight.w700),),
                  onPressed: ()async {
                    Album newPost = new Album(
                      name: controllerNama.text,
                      city: controllerCity.text,
                      ig: controllerIG.text,
//                      user: controllerUser.text,
                    );
                    Album p = await createAlbum(
                        "https://lifei.id/api/user/name?username="+id, body:  newPost.toJson());
                    print('SAVE');
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
