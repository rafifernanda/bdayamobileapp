
import 'package:flutter/material.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';

class PhotoScroller extends StatefulWidget {
  List list;
  int index;
  PhotoScroller({this.index,this.list});
  @override
  _PhotoScrollerState createState() => _PhotoScrollerState();
}

class _PhotoScrollerState extends State<PhotoScroller> {

  final List<String> photoUrls = ["assets/images/Jawa.jpg", "assets/images/Bali.jpg", "assets/images/Sumbar.jpg"];

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          photo,
          width: 160.0,
          height: 120.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: BoldText("Photo", 20.0, kblack)
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}