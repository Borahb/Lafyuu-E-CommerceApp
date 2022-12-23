// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/FavoriteProductScreen/fvaouriteproductlist.dart';
import 'package:lafyuu/Utils/colors.dart';





class FavoriteProduct extends StatefulWidget {
  
  const FavoriteProduct({ Key? key,  }) : super(key: key);

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {

  
  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            const SizedBox(height: 26,),

                Padding(
                  padding: const EdgeInsets.only(left:16,right:16),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: colors.textcolor1,size: 20,)
                        ),
                      const SizedBox(width: 12,),
                      Text('Favorite Product',style:TextStyle(
                        color: colors.textcolor2,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ))
                        ],
                      ),
        
                      Icon(Icons.search,color: colors.textcolor1,size: 25,)
                      
                    ],
                  ),
                ),
                
                const SizedBox(
                      height: 28,
                      child: Divider(),
                      ),
                //const SizedBox(height: 16,),
                FavouriteProductlist(), 
        
          ],
              ),
        )),
    );
  }
}



