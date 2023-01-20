import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class Checkoutbutton extends StatelessWidget {
  const Checkoutbutton({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        color: colors.backgroundcolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text('Check Out',style: TextStyle(
        color: colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 14
      ),),),
    );
  }
}