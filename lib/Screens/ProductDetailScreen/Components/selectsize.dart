import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/sizecard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/sizemodel.dart';

class Selectsize extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Selectsize(  
    this.colors,
  );

  final AppColors colors;
  
  @override
  State<Selectsize> createState() => _SelectsizeState();
}

class _SelectsizeState extends State<Selectsize> {

  int selecteditem = 0 ;


  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Select Size',style: TextStyle(
        color: widget.colors.textcolor2,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),
      const SizedBox(height: 12,),
      SizedBox(
        height: 81,
        child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: SizeModel.size.length,
          itemBuilder: (context,index){
          return SizeCard(
            size: SizeModel.size[index],
            index:index, 
            onchanged: (value) => setState(() {
              selecteditem = index;
            }), 
            selecteditem: selecteditem
            );
          },
        ),
      ),
      ],
    );
  }
}