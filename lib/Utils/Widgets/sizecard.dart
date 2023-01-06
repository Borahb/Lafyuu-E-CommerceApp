// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/sizemodel.dart';

class SizeCard extends StatefulWidget {
  final SizeItem size;
  const SizeCard({ Key? key,required this.size }) : super(key: key);

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {


 
  AppColors colors = AppColors();
  bool toggle = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: (){
             // print('toggle');
              
              setState(() {
                toggle =! toggle;
              });
               //print(toggle);
            },
            child: CircleAvatar(
            radius: 30,
            backgroundColor: (toggle == true) ? colors.backgroundcolor : colors.light,
            child: CircleAvatar(
            backgroundColor: colors.white,
            radius: 29,
            child: Text(widget.size.size,style: TextStyle(
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