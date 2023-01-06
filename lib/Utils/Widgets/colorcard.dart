// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/colormodel.dart';


class ColorCard extends StatefulWidget {
  final Productcolor pcolor;
  const ColorCard({ Key? key,required this.pcolor }) : super(key: key);

  @override
  State<ColorCard> createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {

  AppColors colors = AppColors();
  bool toggle = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: (){
             
              setState(() {
                toggle =! toggle;
              });
               //print(toggle);
            },
            child: CircleAvatar(
            radius: 30,
            backgroundColor: widget.pcolor.color,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: (toggle == true) ? colors.white : widget.pcolor.color,
            ),
              ),
          ),
      );
  }
}