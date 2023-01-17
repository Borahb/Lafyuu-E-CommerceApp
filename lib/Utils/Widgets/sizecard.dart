// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/sizemodel.dart';

class SizeCard extends StatelessWidget {
  final int index;
  final int selecteditem;
  final SizeItem size;
  final ValueChanged onchanged;
  SizeCard({ Key? key,required this.size, required this.index,required this.onchanged, required this.selecteditem}) : super(key: key);




  AppColors colors = AppColors();

  //late var selecteditem = 0 ;
  //bool isselected = true;

  @override
  Widget build(BuildContext context) {
    final isSelected = selecteditem == index;
    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () => onchanged(index),
            child: CircleAvatar(
            radius: 30,
            backgroundColor: isSelected == true ? colors.backgroundcolor : colors.light,
            child: CircleAvatar(
            backgroundColor: colors.white,
            radius: 29,
            child: Text(size.size,style: TextStyle(
            color: colors.textcolor2,
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),),
        ),
      ),
     ),                             
   );
  }
}