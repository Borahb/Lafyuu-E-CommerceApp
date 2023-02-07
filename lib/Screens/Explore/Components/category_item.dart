// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lafyuu/models/categorymodel.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/Utils/colors.dart';

class Categoryitem extends StatelessWidget {
  String name1;
  String name2;
  Categoryitem({
    Key? key,
    required this.name1,
    required this.name2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Usables usables = Usables();
    AppColors colors = AppColors();

    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 16,right:16),
          child: usables.resuablerow(name1,''),
          ),

          Container(height:12),
        
                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: SizedBox(
                    height:265,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: CategoryItem.category.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing:12,
                      //mainAxisExtent: 100,
                      ),
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundColor: colors.light,
                              child: CircleAvatar(
                                radius: 35,
                               backgroundColor: colors.white,
                                child: Center(child: Image.asset(CategoryItem.category[index].image, height: 26, width: 26),),
                                
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(CategoryItem.category[index].name, style: TextStyle(
                                color: colors.textcolor1,
                              fontSize: 10
                            )),

                          ],
                        );
                      },
                    ),
                  ),
                ),
      ],
    );
  }
}
