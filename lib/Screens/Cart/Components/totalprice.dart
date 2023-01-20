import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class Totalprice extends StatelessWidget {
  const Totalprice({
    Key? key,
    required this.colors,
    required this.spec1,
    required this.spec2,
  }) : super(key: key);

  final AppColors colors;
  final String spec1;
  final String spec2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(spec1,style:TextStyle(
          color: colors.textcolor2,
          fontWeight: FontWeight.w700,
          fontSize: 12
        )),
        Text(spec2,style:TextStyle(
          color: colors.backgroundcolor,
          fontWeight: FontWeight.w700,
          fontSize: 12
        )),
      ],
    );
  }
}