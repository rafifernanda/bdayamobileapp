
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thesisproject/Pages/Boarding/SliderDots.dart';
import 'package:thesisproject/Pages/Boarding/SliderItems.dart';
import 'package:thesisproject/Pages/Home.dart';
import 'package:thesisproject/Pages/SignInPage.dart';
import 'package:thesisproject/Utils/TextStyles.dart';
import 'package:thesisproject/Utils/consts.dart';

import 'Slider.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: sliderArrayList.length,
              itemBuilder: (ctx, i) => SlideItem(i),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[

//                Align(
//                  alignment: Alignment.bottomRight,
//                  child: Padding(
//                    padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
//                    child: GestureDetector(
//                      onTap: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>SlideItem(1)));
//                      },
//                        child: BoldText(NEXT,20,kblack)),
//
//                  ),
//                ),


                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>Home()));// Go To Pages/SignInPage.dart
                        },
                        child: BoldText(SKIP,20,kblack)),

                  ),
                ),


                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < sliderArrayList.length; i++)
                        if (i == _currentPage)
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ],
                  ),
                ),
              ],
            )
          ],
        )),
  );
}