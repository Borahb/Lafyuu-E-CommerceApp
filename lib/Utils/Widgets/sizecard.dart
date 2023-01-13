// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/sizemodel.dart';

class SizeCard extends StatefulWidget {
  final int index;
  final SizeItem size;
  const SizeCard({ Key? key,required this.size, required this.index }) : super(key: key);

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {


 
  AppColors colors = AppColors();

  
  late var selecteditem = 0 ;

  

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: (){
            
             selecteditem = widget.index;
             //print(selecteditem);
               //print(toggle);
            },
            child: CircleAvatar(
            radius: 30,
            backgroundColor: (widget.index == selecteditem) ? colors.backgroundcolor : colors.light,
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