
import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/OverViewScreen.dart';

import 'TextStyles.dart';
import 'consts.dart';
//import 'package:clip_shadow/clip_shadow.dart';

class SubCitiesImage extends StatelessWidget {
  final String imgUrl;
  final String city;

  SubCitiesImage(this.imgUrl, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 150,
        child: Stack(
          children: <Widget>[
            Container(
                width: 350,
                height: 150,
                child: ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(15.0)),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                    ))),
            Container(
              width: 350,
              height: 160,
              child: Align(
                  alignment: Alignment.center,

                  child: BoldText(city,25,kwhite)),
            )
          ],
        ),
      );


  }
}