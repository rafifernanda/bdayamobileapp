
import 'package:flutter/cupertino.dart';
import 'package:thesisproject/Utils/consts.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
        @required this.sliderHeading,
        @required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/walkthrough.jpg',
      sliderHeading: SLIDER_HEADING_1,
      sliderSubHeading: SLIDER_DESC1),
  Slider(
      sliderImageUrl: 'assets/images/walkthrough4.jpg',
      sliderHeading: SLIDER_HEADING_2,
      sliderSubHeading: SLIDER_DESC2),
  Slider(
      sliderImageUrl: 'assets/images/two.png',
      sliderHeading: SLIDER_HEADING_3,
      sliderSubHeading: SLIDER_DESC3),
];