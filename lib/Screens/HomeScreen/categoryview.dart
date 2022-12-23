
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/categorycard.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/models/categorymodel.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     Usables usables = Usables();
     
    return Column(
      children: [
        usables.resuablerow('Category','More Category'),
                
                Container(height:12),
        
                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: SizedBox(
                    height:110,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: CategoryItem.category.length,
                      itemBuilder: (context, index){
                        return CategoryCard(
                          //ontap: ()=> print(CategoryItem.category.),
                          category: CategoryItem.category[index]
                          );
                      },
                    ),
                  ),
                ),
      ],
    );
  }
}