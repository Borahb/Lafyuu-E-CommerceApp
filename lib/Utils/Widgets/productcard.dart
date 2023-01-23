
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/productmodel.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback ontap;
  final Product product ;
  ProductCard({ Key? key, required this.product,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  AppColors colors = AppColors();
    return Padding(
      padding: const EdgeInsets.only(right:16),
      child: GestureDetector(
        onTap: ontap ,
        child: Container(
          height:231 ,
          width: 141,
          
          decoration: BoxDecoration(
            color: colors.white,
            border: Border.all(color: colors.light),
            borderRadius: BorderRadius.circular(5)
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image,height: 109,width:109),
                const SizedBox(height: 8,),
                Text(product.name,style: TextStyle(
                  color: colors.textcolor2,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 8,),
                Text('Rs ${product.price}',style: TextStyle(
                  color: colors.backgroundcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Text('Rs 534,33',style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: colors.textcolor1,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),),
                    const SizedBox(width: 8,),
                    Text('24% Off',style: TextStyle(
                      color: colors.errorcolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}