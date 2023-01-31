// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class CTimer extends StatefulWidget {
  const CTimer({ Key? key }) : super(key: key);

  @override
  State<CTimer> createState() => _CTimerState();
}

class _CTimerState extends State<CTimer> {


AppColors colors = AppColors();


Timer? countdownTimer;
Duration myDuration = Duration(hours: 8);

  void startTimer() {
    countdownTimer =
      Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  String strDigits(int n) => n.toString().padLeft(2, '0');
  
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }


  @override
  Widget build(BuildContext context) {
  final hours = strDigits(myDuration.inHours);
  final minutes = strDigits(myDuration.inMinutes.remainder(60));
  final seconds = strDigits(myDuration.inSeconds.remainder(60));
  
    return SizedBox(
      height:25,
      child: Column(
        children: [

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Container(
                  height: 41,
                  width: 42,
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                    hours,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colors.textcolor2,
                    fontSize: 24),
                        ),
                  ),
                ),
              ),


            Text(':',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.white,
            fontSize: 24),),


              Padding(
                padding: const EdgeInsets.only(right: 4,left:4),
                child: Container(
                  height: 41,
                  width: 42,
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                    minutes,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colors.textcolor2,
                    fontSize: 24),
                  ),
                  ),
                ),
              ),

            Text(':',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.white,
            fontSize: 24),),

              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  height: 41,
                  width: 42,
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                    seconds,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colors.textcolor2,
                    fontSize: 24),
                  ),
                  ),
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
}