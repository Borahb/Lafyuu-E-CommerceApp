// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/Explore/Components/category_item.dart';
import 'package:lafyuu/Screens/Explore/Components/searchbar.dart';
import 'package:lafyuu/Utils/Widgets/categorycard.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/categorymodel.dart';


class Explore extends StatelessWidget {
  const Explore({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Usables usables = Usables();
    AppColors colors = AppColors();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child:Column(
          children: [
            const SizedBox(height: 16,),
            const Searchbar(),

            const SizedBox(
                    height: 16,
                    child: Divider(),
                  ),

            const SizedBox(height: 16,),

            Categoryitem(name1: 'Man Fashion', name2: ''),

            const SizedBox(height: 24,),

            Categoryitem(name1: 'Woman Fashion', name2: ''),

                 
                
                
            
          ],
        ) ,)
      ),
    );
  }
}
