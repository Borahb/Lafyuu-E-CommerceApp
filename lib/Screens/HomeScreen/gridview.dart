
import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/gridviewcard.dart';
import 'package:lafyuu/models/productmodel.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing:12,
                    mainAxisExtent: 290,
                    
                    ),
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return GridCard(product: ProductModel.products[index]);
                    },
                    ),
                );
  }
}