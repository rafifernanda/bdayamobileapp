import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SignInPage.dart';
import 'package:thesisproject/Utils/Buttons.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';
import 'package:thesisproject/Utils/Forms.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: NormalText("Register", kblack, 20.0),
          backgroundColor: kwhite,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
                  Icon(
                    FontAwesomeIcons.campground,
                    color: kdarkBlue,
                    size: 35,
                  ),
                  SizedBox(height: 10),
                  BoldText("B-Daya", 30.0, kdarkBlue),
                  NormalText("Let's Preserve It", kdarkBlue, 30.0),
                  SizedBox(
                    height: 20,
                  ),
                  Container(width: 340.0, child: NormalForm(Icons.person, "Full name")),
                  SizedBox(
                    height: 30,
                  ),
                  Container(width: 340.0, child: NormalForm(Icons.email, "Email")),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 340.0,
                    child: PasswordForm(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  WideButton.bold("Register", () {
                    Navigator.of(context, rootNavigator: true)
                        .push(CupertinoPageRoute<bool>(
                      fullscreenDialog: true,
                      builder: (context) => null,
                    ));
                  }, true),
                  SizedBox(
                    height: 20,
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Container(
//                        height: 2,
//                        width: 100,
//                        color: kdarkBlue,
//                      ),
//                      NormalText("Or Sign in with", kdarkBlue, 12.5),
//                      Container(
//                        height: 2,
//                        width: 100,
//                        color: kdarkBlue,
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  Icon(
//                    FontAwesomeIcons.facebookSquare,
//                    color: Colors.blue.shade600,
//                    size: 40.0,
//                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      NormalText("Have an account ?", kdarkBlue, 12.5),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (context) => SignInPage(),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0,),
                          child: BoldText.veryBold("Sign In ?", 12.5, korange,true),
                        ),
                      ),
                    ],
                  ),
                ]))));
  }
}