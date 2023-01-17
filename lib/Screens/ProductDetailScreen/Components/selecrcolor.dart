import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/colorcard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/colormodel.dart';

class Selectcolor extends StatefulWidget {
  const Selectcolor({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  State<Selectcolor> createState() => _SelectcolorState();
}

class _SelectcolorState extends State<Selectcolor> {

  int selecteditem = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Select Color',style: TextStyle(
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
          itemCount: Colormodel.productcolor.length,
          itemBuilder: (context,index){
            return ColorCard(
              pcolor: Colormodel.productcolor[index], 
              index: index, 
              onchanged: (value) => setState(() {
                selecteditem = index;
              }) , 
              selecteditem: selecteditem,
              );
          },
        ),
      ),
      ],
    );
  }
}