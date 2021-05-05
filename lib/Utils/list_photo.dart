import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';

class List_Photo extends StatelessWidget {
  final String imageUrl;
  final String name;

  List_Photo(this.imageUrl, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 120.0,
            height: 120.0,
            child: ClipRRect(
                borderRadius: new BorderRadius.all(
                  Radius.circular(15),),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                )),
          ),
          BoldText(name,16.0,kblack),
        ],
      ),
    );
  }

}