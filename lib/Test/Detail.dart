import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/CommentsPage.dart';
import 'package:thesisproject/Pages/DashboardPage.dart';
import 'package:thesisproject/Pages/Home.dart';
import 'package:thesisproject/Pages/List_Culture.dart';
import 'package:thesisproject/Pages/List_Jawa.dart';
import 'package:thesisproject/Pages/List_Maluku.dart';
import 'package:thesisproject/Pages/List_Nusa.dart';
import 'package:thesisproject/Pages/List_Sumatra.dart';
import 'package:thesisproject/Pages/Video_Player.dart';
import 'package:thesisproject/Test/actor_scroller.dart';
import 'package:thesisproject/Test/models.dart';
import 'package:thesisproject/Test/movie_detail_header.dart';
import 'package:thesisproject/Test/photo_scroller.dart';
import 'package:thesisproject/Test/story_line.dart';
import 'package:thesisproject/Utils/BestRatedImage.dart';
import 'package:thesisproject/Utils/RecommendationImage.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/list_photo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Album> createAlbum(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response){
    final int statusCode = response.statusCode;
    if(statusCode < 200 || statusCode > 400 || json == null){
      throw new Exception("Error while fetching data");
    }
    return Album.fromJson(json.decode(response.body));
  });
}

class Album {
//  String id_comment;
  String comment;

  Album(
      {
//        this.id_comment,
        this.comment,
      });

  Album.fromJson(Map<String, dynamic> json) {
//    id_comment: json['id_comment'];
    comment: json['comment'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id_comment'] = this.id_comment;
    data['comment'] = this.comment;
    return data;
  }
}

class Detail_App extends StatelessWidget {
  String id;
  String video;
  String api;
  Detail_App({this.id, this.video, this.api});
  @override
  Widget build(BuildContext context) {
    String value = id;
    String value2 = video;
    String value3 = api;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      home: MovieDetailsPage(value:value, value2:value2, value3: value3,),
    );
  }
}
class MovieDetailsPage extends StatefulWidget {
  String value;
  String value2;
  String value3;
  MovieDetailsPage({this.value, this.value2, this.value3});
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final TextEditingController controllerid = TextEditingController();
  final TextEditingController controllercomment = TextEditingController();


  YoutubePlayerController _controller;
  YoutubePlayerController _controller2;

  Map data;
  List userData;
  List list;
  Future getData() async {
    String id = widget.value;
    String api = widget.value3;
    print(widget.value);
    http.Response response = await http.get(
        "http://127.0.0.1:8080/apibdaya/api/"+api+id); //"https://lifei.id/api/"+api+id);
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
    print(userData[0]["nama"]);
    print(widget.value);

    return response;
  }

  @override
  void initState() {
    String videoURL = widget.value2;
//    checkLoginStatus();


//    _controller = YoutubePlayerController(
//        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
//    );
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        )
    );
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        )
    );

    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
//    String tarirakyat2 = "A folk dance is a dance developed by people that reflect the life of the people of a certain country or region.";
//    String rumahadat2 = "Rumah adat are traditional houses built in any of the vernacular architecture styles of Indonesia.";
//    String bajuadat = "A folk costume expresses an identity through costume, which is usually associated with a geographic area or a period of time in history.";
//    String senjata = "Traditional weapons are cultural products that are closely related to a society. Besides being used to protect against enemy attacks, traditional weapons are also used in farming and hunting activities.";
//    String tarirakyat = "A folk dance is a dance developed by people that reflect the life of the people of a certain country or region. Not all ethnic dances are folk dances. For example, ritual dances or dances of ritual origin are not considered to be folk dances.";
//    String rumahadat = "Rumah adat are traditional houses built in any of the vernacular architecture styles of Indonesia. The traditional houses and settlements of the several hundreds ethnic groups of Indonesia are extremely varied and all have their own specific history.";
    return Scaffold(
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (context, index){
        return Column(
          children: [
            MovieDetailHeader(list:userData, index: index,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Storyline(list:userData, index: index,),
            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Column(
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.only( top: 5,bottom: 8.0),
//                    child: Align(
//                        alignment: Alignment.center,
//                        child: BoldText("Photos", 20.0, kblack)),
//                  ),
//                  Container(
//                    width: 400,
//                    height: 200,
//                    child: ListView(
//                      scrollDirection: Axis.horizontal,
//                      children: <Widget>[
//                        List_Photo("assets/images/Jawa.jpg", ""),
//                        List_Photo("assets/images/Bali.jpg", ""),
//                        List_Photo("assets/images/Nusa.jpg", ""),
//                        List_Photo("assets/images/Maluku.png", ""),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),

//          Column(
//            children: <Widget>[
//
//              YoutubePlayer(
//                controller: _controller,
//                showVideoProgressIndicator: true,
//              ),
//
//            ],
//          ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: BoldText("Traditional House", 20.0, kblack)
          ),
        ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(
                    "${userData[index]["image_rumah"]}",
                    width: 160.0,
                    height: 190.0,
                    fit: BoxFit.cover,
                  ),
          ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                  child: Container(
                    width: 200,
                    child: Text("${userData[index]["rumah_adat"]}",
                      style: textTheme.body1.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontFamily: 'nunito'
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: BoldText("Folk Dance", 20.0, kblack)
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                  child: Container(
                    width: 200,
                    child: Text("${userData[index]["tari_rakyat"]}",
                      style: textTheme.body1.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontFamily: 'nunito'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "${userData[index]["image_tari"]}",
                      width: 160.0,
                      height: 190.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: BoldText("Folk Costume", 20.0, kblack),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "${userData[index]["image_baju"]}",
                      width: 160.0,
                      height: 190.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                  child: Container(
                    width: 200,
                    child: Text("${userData[index]["baju_adat"]}",
                      style: textTheme.body1.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontFamily: 'nunito'
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: BoldText("Traditional Weapon", 20.0, kblack)
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                  child: Container(
                    width: 200,
                    child: Text("${userData[index]["senjata"]}",
                      style: textTheme.body1.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontFamily: 'nunito'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "${userData[index]["image_senjata"]}",
                      width: 160.0,
                      height: 190.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: BoldText("Video", 20.0, kblack)
              ),
            ),

            CustomContainer(
              child: Column(
                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Text(
//                        "Data",
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: 15.0,
//                  ),

                  Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: YoutubePlayer(
                          controller: _controller2,
                          showVideoProgressIndicator: true,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  autocorrect: false,
                  controller: controllercomment,
                  decoration: InputDecoration(
                    hintText: 'Tell the admin if there is missinformation or error data such (images, text, and videos)',
                    hintStyle: TextStyle(fontFamily: 'nunito'),
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: korange,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text('SUBMIT', style: TextStyle(fontFamily: 'nunito', color: kwhite, fontWeight: FontWeight.w700),),
              onPressed: () async {

                Album newPost = new Album(
                  comment: controllercomment.text,
                );
                Album p = await createAlbum(
                    "https://lifei.id/api/comment/comment",
                    body:  newPost.toJson());
                print('create');
                final snackBar = SnackBar(
                  content: Text('Thanks for your comment!'),
                  action: SnackBarAction(
                    label: 'Show Comment',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Comments()));
                    },
                  ),
                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
                Scaffold.of(context).showSnackBar(snackBar);

              },
            ),

            SizedBox(height: 50.0),
          ],
        );
  }
      ),
    );
  }
}
class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(41),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

//class SnackBarPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: RaisedButton(
//        onPressed: () {
//          final snackBar = SnackBar(
//            content: Text('Yay! A SnackBar!'),
//            action: SnackBarAction(
//              label: 'OK',
//              onPressed: () {
//                // Some code to undo the change.
//              },
//            ),
//          );
//
//          // Find the Scaffold in the widget tree and use
//          // it to show a SnackBar.
//          Scaffold.of(context).showSnackBar(snackBar);
//        },
//        child: Text('Show SnackBar'),
//      ),
//    );
//  }
//}