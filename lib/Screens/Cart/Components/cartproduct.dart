import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/colors.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        //width: 343,
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: colors.light)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            
            children: [
              Image.asset('images/P1.jpg',height:72, width: 72,),
              const SizedBox(width: 12,),
              Column(
                children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nike Air Zoom Pegasus\n36 Miami',style:TextStyle(
                color: colors.textcolor2,
                fontWeight: FontWeight.w700,
                fontSize: 16
                   )),
                   const SizedBox(width: 25,),
                Row(
                  children: [
                    SvgIcon(icon: SvgIconData('images/lovered.svg'),color: colors.errorcolor, size: 20,),
                    const SizedBox(width: 8,),
                    Icon(Icons.delete,color: colors.textcolor1,)
                  ],
                )
              ],
            ),

            const SizedBox(height: 16,),

            Row(
              children: [
                Text("Rs 299,43",style:TextStyle(
                color: colors.backgroundcolor,
                fontWeight: FontWeight.w700,
                fontSize: 12
                   )),
              ],
            )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}