import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/productcard.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/models/favouriteproduct.dart';
import 'package:lafyuu/models/productmodel.dart';

class ProductView extends StatelessWidget {
  final String name;
  final String name2;
  const ProductView({ Key? key,required this.name, required this.name2}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _item = FavoriteProductModel();
    final _product = ProductModel();

    Usables usables = Usables();
   
    return SizedBox(
                  height: 271,
                  width: 455,
                  child: Column(
                    children: [
                      usables.resuablerow('Flash Sale','See More'),
                      const SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right:16),
                        child: SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ProductModel.products.length,
                            itemBuilder: (context,index){
                              
                              final Product item = ProductModel.products[index];
                              bool isInfav = _item.items.contains(item) ? true: false ;
                              return ProductCard(
                              ontap: (){
                                if(isInfav == false){
                              _item.products = _product;
                              _item.add(item);
                                }
                                
                              
                              
                              } ,
                              product: ProductModel.products[index]
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
  }
}