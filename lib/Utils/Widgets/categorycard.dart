
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/categorymodel.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({ Key? key, required this.category }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppColors colors = AppColors();
    
    return Padding(
      padding: const EdgeInsets.only(right:12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 66,
            backgroundColor: colors.light,
            child: CircleAvatar(
                radius: 65,
                backgroundColor: colors.white,
                child: Center(
                  child: Image.asset(category.image, height: 24, width: 24)
                ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(category.name, style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10
          )),
        ],
      ),
    );
  }
}