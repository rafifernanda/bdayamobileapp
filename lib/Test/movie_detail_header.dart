import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/OverViewScreen.dart';
import 'package:thesisproject/Test/arc_banner_image.dart';
import 'package:thesisproject/Test/models.dart';
import 'package:thesisproject/Test/poster.dart';

class MovieDetailHeader extends StatefulWidget {
  List list;
  int index;
  MovieDetailHeader({this.index,this.list});
  @override
  _MovieDetailHeaderState createState() => _MovieDetailHeaderState();
}

class _MovieDetailHeaderState extends State<MovieDetailHeader> {

  @override
  Widget build(BuildContext context) {
    String value = widget.list[widget.index]["banner"];
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.list[widget.index]["nama"]}",
          style: textTheme.title.copyWith(fontSize: 21, fontFamily: 'nunito'),
        ),
        SizedBox(height: 3.0),
        Text(
          "${widget.list[widget.index]["alias"]}", style: TextStyle(fontFamily: 'nunito'),
        )
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailImage(value: value);
              }));
            },
              child: ArcBannerImage("${widget.list[widget.index]["banner"]}")),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                "${widget.list[widget.index]["image"]}",
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}