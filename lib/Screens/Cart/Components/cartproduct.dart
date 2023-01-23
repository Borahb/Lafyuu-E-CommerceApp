import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/cartmodel.dart';
import 'package:lafyuu/models/favouriteproduct.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {

  final _product = CartProductModel();
  final _favproduct = FavoriteProductModel();
  num quan = 1;

  @override
  Widget build(BuildContext context) {
    

    return ListView.builder(
    shrinkWrap:true,
    itemCount: _product.items.length,
    itemBuilder: (context,index){ 

      bool isinfav = _favproduct.items.contains(_product.items[index]) ;

      if(_product.items.isEmpty){
        return Center(
          child: Text('No items added in cart',style:TextStyle(
                  color: widget.colors.textcolor1,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                     )),
        );
      }

      return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        //width: 343,
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: widget.colors.light)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            
            children: [
            Image.asset(_product.items[index].image,height:72, width: 72,),

            const SizedBox(width: 12,),

            Column(
                children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_product.items[index].name,style:TextStyle(
                color: widget.colors.textcolor2,
                fontWeight: FontWeight.w700,
                fontSize: 16
                   )),

                const SizedBox(width: 13,),

                Row(
                  children: [
                    isinfav ? SvgIcon(icon: const SvgIconData('images/lovered.svg'),color: widget.colors.errorcolor,size: 20, ): SvgIcon(icon: const SvgIconData('images/love.svg'),color: widget.colors.textcolor1 ),
                    
                    const SizedBox(width: 8,),

                    GestureDetector(
                      onTap: (){
                        _product.remove(_product.items[index]);
                      setState(() {});
                      },
                      child: Icon(Icons.delete,color: widget.colors.textcolor1,))
                  ],
                )
              ],
            ),

            const SizedBox(height: 8,),

            Row(
              
              children: [
                Text("Rs ${_product.items[index].price}",style:TextStyle(
                color: widget.colors.backgroundcolor,
                fontWeight: FontWeight.w700,
                fontSize: 12
                   )),

                const SizedBox(width: 71,),

                Row(
                  children: [

                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5)),
                          border: Border.all(color: widget.colors.light )
                        ),
                        child: Center(child: Icon(Icons.remove,size: 20,color:widget.colors.textcolor1),),
                      ),
                    ),

                    Container(
                      width: 30,
                      height: 24,
                      decoration: BoxDecoration(
                        color: widget.colors.light,
                        border: Border.all(color: widget.colors.light )
                      ),
                      child: Center(child:Text(quan.toString(),style:TextStyle(
                        color: widget.colors.textcolor1,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                          )) ),
                      ),

                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        width: 30,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(5),bottomRight:Radius.circular(5)),
                          border: Border.all(color: widget.colors.light )
                        ),
                        child: Center(child: Icon(Icons.add,size: 20,color:widget.colors.textcolor1),),
                      ),
                    ),
                  ],
                )
              ],
            )

                ],
              ),
            ],
          ),
        ),
      ),
    ); 
    }
    );
  }
}