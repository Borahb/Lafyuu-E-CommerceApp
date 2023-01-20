import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class Couponbar extends StatelessWidget {
  const Couponbar({
    Key? key,
    required this.width,
    required this.colors,
  }) : super(key: key);

  final double width;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          width: .65 * width,
          decoration: BoxDecoration(
            border: Border.all(color: colors.light),
            color: colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5))
          ),

          child: const TextField(
            
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
          top: 17, bottom: 17, left: 16,),
              hintText: 'Enter Coupon Code',

            ),
          )

        ),
        Container(
          height: 56,
          width: .27 * width,
          decoration: BoxDecoration(
            color:colors.backgroundcolor,
            
            borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight:Radius.circular(5))
          ),
          child: Center(
            child: Text('Apply',style:TextStyle(
              color: colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12
            )),
          ),
        ) 
      ],
    );
  }
}