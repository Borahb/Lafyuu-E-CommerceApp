import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/HomeScreen/Components/productview.dart';
import 'package:lafyuu/Utils/colors.dart';

class Productadd extends StatelessWidget {
  const Productadd({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Specification',style: TextStyle(
        color: colors.textcolor2,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),
      const SizedBox(height: 12,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Shown:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
            Text('Laser',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Text('Blue/Anthracite/Watermel',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Text('on/White',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Style:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
            Text('CD0113-400',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Wrap(
          children: [ 
            Text('The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',style: TextStyle(
              color: colors.textcolor2,
              fontSize: 12,
              fontWeight: FontWeight.w400
              ),),]
        ),

        const SizedBox(height: 24,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Review Product:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),),
            Text('See More',style: TextStyle(
            color: colors.backgroundcolor,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),),
          ],
        ),

        const SizedBox(height: 8,),

        Row(
          children: [
            Image.asset('images/star.png',width: 96,height: 16,),
            const SizedBox(width: 8,),
            Text('4.5',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w700
            ),),
            const SizedBox(width: 3,),
            Text('(5 Review)',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Row(
          children: [
            Image.asset('images/Ppic.png', height: 48,width:48),
             const SizedBox(width: 16,),
            Column(
            children: [
            Text('James Lawson',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),), 
            Image.asset('images/star.png',width: 96,height: 16,),
              ],
            )
          ]

        ),

        const SizedBox(height: 16,),

        Wrap(
          children: [ 
            Text('air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',style: TextStyle(
              color: colors.textcolor1,
              fontSize: 12,
              fontWeight: FontWeight.w400
              ),),]
        ),

        const SizedBox(height: 16,),

        Row(
          children: [
            Image.asset('images/Product Picture02.png', height: 72,width:72),
            const SizedBox(width: 12,),
            Image.asset('images/Product Picture03.png', height: 72,width:72),
            const SizedBox(width: 12,),
            Image.asset('images/Product Picture01.png', height: 72,width:72),
          ]
        ),

        const SizedBox(height: 16,),

        Text('December 10, 2016',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w400
            ),),

        const SizedBox(height: 20,),

        const ProductView(name: 'You Might Also Like', name2: ''),

        const SizedBox(height: 21,),

        Container(
        height: 57,
        decoration: BoxDecoration(
        color: colors.backgroundcolor,
        borderRadius: BorderRadius.circular(5)),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        'Add To Cart',
        style: TextStyle(
        color: colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700),
        )
        ],
        ),
        ),

        const SizedBox(height: 25,),

      ],
    );
  }
}