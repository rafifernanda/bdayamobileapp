import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';
import 'Forms.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 600.0,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/hometop.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 120.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BoldText("What are you", 30.0, kwhite),
                  BoldText("Looking for?", 30.0, kwhite)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NormalForm(Icons.search, "Search News?"),
            ),
          )
        ],
      ),
    );
  }
}