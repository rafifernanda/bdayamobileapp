import 'package:flutter/material.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Map data;//array
  List userData;
  List list;//dataList.size

  Future getData() async {
    http.Response response = await http.get(
        "http://127.0.0.1:8080/apibdaya/api/comment"); //"https://lifei.id/api/comment/comment");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
//    print(userData[0]["nama"]);

    return response;
  }

  Future deleteData(String id, index) async {
//    String id = widget.list[widget.index]["id"].toString();
//    print(widget.list[widget.index]["id"]);
    setState(() {
      userData.removeAt(index);
    });
    final http.Response response = await http.delete(
      'https://lifei.id/api/comment/comment?id='+ id,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
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
        backgroundColor: kwhite,
        appBar: AppBar(
          backgroundColor: kwhite,
          title: BoldText("Comments", 25, kblack),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (context, index){
            return Dismissible(
              background: stackBehindDismiss(),
              key: ObjectKey(userData[index]),
              onDismissed: (direction){
                String id = userData[index]["id_comment"];
                deleteData(id, index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Comment ${userData[index]["id_comment"]} deleted")));
              },
              child: Column(
                children: <Widget>[
                  Container(
                height: 100,
                child: Card(

                  elevation: 1,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BoldText("Comment ${userData[index]["id_comment"]}", 20.0, kblack),
//                            GestureDetector(
//                              onTap: (){
//                                String id = userData[index]["id_comment"];
//                                deleteData(id,index);
//                              },
//                                child:
                                BoldText("Swipe to delete", 12.0, kblack)
//                            )
                          ],
                        ),
                        NormalText("${userData[index]["comment"]}",kgreyDark,16),
                        NormalText("${userData[index]["time"]}",kdarkBlue,12),


                      ],
                    ),
                  ),
                ),
              ),
                ],
              ),
            );
  }
          ),
        ));

  }
  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

//  Padding notification() {
//    return Padding(
//      padding: const EdgeInsets.all(16.0),
//      child: Container(
//        height: 100,
//        child: Card(
//
//          elevation: 1,
//
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    BoldText("Lorem ipsum", 20.0, kblack),
//                    Icon(Icons.more_horiz,size: 20.0,color: kblack,)
//                  ],
//                ),
//                NormalText("Lorem ipsum dolor sit amet, consectetur.",kgreyDark,16),
//                NormalText("07,Mar at 15:30 pm",kdarkBlue,12),
//
//
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
}