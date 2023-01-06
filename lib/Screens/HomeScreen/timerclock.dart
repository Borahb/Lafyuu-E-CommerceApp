
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class CTimer extends StatefulWidget {
  const CTimer({ Key? key }) : super(key: key);

  @override
  State<CTimer> createState() => _CTimerState();
}

class _CTimerState extends State<CTimer> {


AppColors colors = AppColors();
Duration _duration = Duration(hours: 8,minutes: 34);
  


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:25,
      child: Column(
        children: [
           SlideCountdownClock(
            duration: _duration,
            slideDirection: SlideDirection.Up,
            separator: ':',
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: colors.textcolor2,
            ),
             decoration: BoxDecoration(color: colors.white,borderRadius: BorderRadius.circular(1) ),
            )

        ],
      ),
    );
  }
}