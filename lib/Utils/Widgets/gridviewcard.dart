
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/productmodel.dart';

class GridCard extends StatelessWidget {
  final Product product;
  const GridCard({ Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppColors colors = AppColors();
    
    return Container(
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
              Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.fill
                  )
              ),
              ),
              const SizedBox(height: 8,),
              Text(product.name,style: TextStyle(
                color: colors.textcolor2,
                fontSize: 12,
                fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 4,),
              Image.asset('images/star.png',width: 68,height: 12,),
              const SizedBox(height: 16,),
              Text('Rs 299,43',style: TextStyle(
                color: colors.backgroundcolor,
                fontSize: 12,
                fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 8,),
              Row(
                children: [
                  Text('Rs ${product.price}',style: TextStyle(
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
                          )
                        );
  }
}