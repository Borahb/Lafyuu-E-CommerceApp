import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:16,right:16,top:16),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Cart',style:TextStyle(
              color: colors.textcolor2,
              fontWeight: FontWeight.w700,
              fontSize: 16
            )),
          ],
        ),
      );
  }
}
