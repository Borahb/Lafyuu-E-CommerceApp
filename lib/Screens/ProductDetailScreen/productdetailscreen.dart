// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/Components/addproduct.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/Components/productimages.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/Components/productname.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/Components/selecrcolor.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/Components/selectsize.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/productmod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class ProductDetailScreen extends StatefulWidget {
  final int index;
  final Product product;
  const ProductDetailScreen({ Key? key, required this.product, required this.index}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  AppColors colors = AppColors();
  int selecteditem = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
             
            children: [

              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16.0,top: 16.0),
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
                        Text(widget.product.title.substring(0,10)+ '...',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style:TextStyle(
                          color: colors.textcolor2,
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                        ),
                        )
                          ],
                        ),
        
                        Icon(Icons.search,color: colors.textcolor1,size: 25,)
                        
                      ],
                    ),
              ),

              //product images
              const SizedBox(height: 16,),
              
              ProductImages(product: widget.product, colors: colors),
                                 
              const SizedBox(height:16),

              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: Column(

                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [

                    Productname(index: widget.index,colors: colors, name: widget.product.title, product: widget.product,),
                    
                    const SizedBox(height: 8,),

                    RatingBar(
                      itemSize: 20,
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                      full: Image.asset('images/Star 6.png'),
                      half: Image.asset('images/Star 6.png'),
                      empty: Image.asset('images/Star 10.png'),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                      onRatingUpdate: (rating) {
                        //print(rating);
                      },
                      ),

                    //Image.asset('images/star.png',width: 96,height: 16,),
                    const SizedBox(height: 16,),

                    Text('Rs ${widget.product.price}',style: TextStyle(
                          color: colors.backgroundcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),),
                    
                    const SizedBox(height: 24,),

                    Selectsize(colors),

                    const SizedBox(height: 24,),

                    Selectcolor(colors: colors,),

                    const SizedBox(height: 24,),

                    Productadd(colors: colors, product: widget.product,),



                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}









