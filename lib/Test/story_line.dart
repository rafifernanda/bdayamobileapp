import 'package:flutter/material.dart';

class Storyline extends StatefulWidget {
  List list;
  int index;
  Storyline({this.index,this.list});
  @override
  _StorylineState createState() => _StorylineState();
}

class _StorylineState extends State<Storyline> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Story line',
          style: textTheme.subhead.copyWith(fontSize: 18.0, fontFamily: 'nunito'),
        ),
        SizedBox(height: 8.0),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
          style: textTheme.body1.copyWith(
            color: Colors.black45,
            fontSize: 16.0,
              fontFamily: 'nunito'
          ),
        ),
        // No expand-collapse in this tutorial, we just slap the "more"
        // button below the text like in the mockup.
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'text',
              style: textTheme.body1
                  .copyWith(fontSize: 16.0, color: theme.accentColor),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18.0,
              color: theme.accentColor,
            ),
          ],
        ),
      ],
    );
  }
}