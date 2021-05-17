
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thesisproject/Pages/Edit_Profile.dart';
import 'package:thesisproject/Pages/SignInPage.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Map data;
  List userData;
  List list;
  Future getData() async {
    http.Response response = await http.get(
        "http://127.0.0.1:8080/apibdaya/api/profile");//"https://lifei.id/api/user/transaksi?username=rafi");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
    print(userData[0]["name"]);

    return response;
  }

  @override
  void initState() {
    super.initState();
//    checkLoginStatus();
    this.getData();
//    RefreshList();
  }

  Future<void> confirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you Sure want to Logout?",style: TextStyle(fontFamily: 'nunito'),),
          actions: <Widget>[
            RaisedButton(
              child: Text("YES",style: TextStyle(fontFamily: 'nunito', color: kwhite),),
              color: korange,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> SignInPage()));
              },
            ),
            RaisedButton(
              child: Text("CANCEL",style: TextStyle(fontFamily: 'nunito', color: kwhite),),
              color: Colors.grey[300],
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Profile", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (context, index){
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/me.jpg"),
                    radius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        BoldText("${userData[index]["name"]}",20.0,kblack),
                        Row(
                          children: <Widget>[
                            NormalText("${userData[index]["city"]}",kgreyDark,16),
                            Icon(
                              Icons.location_on,
                              color: kgreyDark,
                              size: 15.0,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget> [
                            GestureDetector(
                              onTap: () {
                                _launchInstagram();
                              },
                                child: NormalText("${userData[index]["ig"]}",kgreyDark,16)),
                            Icon(
                              FontAwesomeIcons.instagram,
                              color: kdarkBlue,
                              size: 15.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 2,
              color: kgreyFill,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> EditData(list: userData, index: index,)));
//                final snackBar = SnackBar(
//                  content: Text('Coming Soon!'),
//                  action: SnackBarAction(
//                    label: 'OK',
//                    onPressed: () {
//                      // Some code to undo the change.
//                    },
//                  ),
//                );

                // Find the Scaffold in the widget tree and use
                // it to show a SnackBar.
//                Scaffold.of(context).showSnackBar(snackBar);
              },
                child: ProfileItem(Icons.person,"My Profile")),
//            ProfileItem(Icons.credit_card,"Payment"),
//            ProfileItem(Icons.settings,"Settings"),
            GestureDetector(
                onTap: (){
                  final snackBar = SnackBar(
                    content: Text('Coming Soon!'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the Scaffold in the widget tree and use
                  // it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: ProfileItem(Icons.help,"Help")),
//            ProfileItem(Icons.favorite_border,"Favourite"),
            GestureDetector(
                onTap: (){
                  final snackBar = SnackBar(
                    content: Text('Coming Soon!'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the Scaffold in the widget tree and use
                  // it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: ProfileItem(Icons.library_books,"Terms and Conditions")),
            GestureDetector(
                onTap: (){
                  final snackBar = SnackBar(
                    content: Text('Coming Soon!'),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the Scaffold in the widget tree and use
                  // it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: ProfileItem(Icons.info,"About Us")),
            GestureDetector(
              onTap: ()=>confirm(),
                child: ProfileItem(Icons.exit_to_app,"Sign Out")),


          ],
        );
  }
      ),
    );
  }

  Widget ProfileItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 9),
      child: Row(
        children: <Widget>[
          Icon(icon, color: kdarkBlue,size: 40,),
          SizedBox(width: 8,),
          NormalText(text,kblack,20.0)
        ],
      ),
    );
  }
  void _launchInstagram () async {
//    String location;
    final url = 'https://www.instagram.com/mrafifernanda/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}