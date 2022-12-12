import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/usables.dart';




class GridV extends StatefulWidget {
  final String image;
  const GridV({ Key? key, required this.image }) : super(key: key);

  @override
  State<GridV> createState() => _GridVState();
}

class _GridVState extends State<GridV> {
  Usables usables = Usables();

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing:12
        ), 
      children: [
        
      ],
      );
  }
}