// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/colormodel.dart';


class ColorCard extends StatelessWidget {
  final Productcolor pcolor;
  final int index;
  final int selecteditem;
  final ValueChanged onchanged;
  ColorCard({ Key? key,required this.pcolor, required this.index, required this.selecteditem, required this.onchanged}) : super(key: key);


  AppColors colors = AppColors();
  bool toggle = false;


  @override
  Widget build(BuildContext context) {
    final isselected = selecteditem == index;
    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: ()=> onchanged(index),
            child: CircleAvatar(
            radius: 30,
            backgroundColor: pcolor.color,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: isselected ? colors.white : pcolor.color,
            ),
              ),
          ),
      );
  }
}