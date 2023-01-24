import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/Cart/Components/appbar.dart';
import 'package:lafyuu/Screens/Cart/Components/billspecification.dart';
import 'package:lafyuu/Screens/Cart/Components/cartproduct.dart';
import 'package:lafyuu/Screens/Cart/Components/checkoutbutton.dart';
import 'package:lafyuu/Screens/Cart/Components/coupobbar.dart';
import 'package:lafyuu/Screens/Cart/Components/totalprice.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/cartmodel.dart';


class Cart extends StatefulWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final AppColors colors = AppColors();

  final _product = CartProductModel();
  int ship = 120;
  int import = 120;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

                Appbar(colors: colors),

                const SizedBox(
                      height: 28,
                      child: Divider(),
                      ),

                const SizedBox(height: 16,),



                _product.items.isNotEmpty ? Padding(
                  padding: const EdgeInsets.only(left:16,right:16,),
                  child: Column(
                    children: [


                      CartProduct(colors: colors),
                        

                      Couponbar(width: width, colors: colors),

                      const SizedBox(height: 16,),

                      Container(
                        height: 164,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:Border.all(color:colors.light),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Billspecification(colors: colors,spec1:'Items (${_product.items.length.toString()})' ,spec2:'Rs ${_product.totalPrice}',),

                              const SizedBox(height: 16,),

                              Billspecification(colors: colors,spec1:'Shipping' ,spec2:'Rs ${ship.toString()}',),

                              const SizedBox(height: 16,),

                              Billspecification(colors: colors,spec1:'Import charges' ,spec2:'Rs ${import.toString()}',),
                      
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(height: 16,
                                child: Divider(color:colors.light,)),
                              ),

                              Totalprice(colors: colors,spec1: 'Total Price', spec2: 'Rs ${_product.totalPrice + ship + import}',)
                             
                          ],),
                        ),
                      ),

                      const SizedBox(height: 16,),

                      Checkoutbutton(colors: colors)

                    ],
                  ),
                ): Center(child:Text('There is nothing in your cart.',style:TextStyle(
          color: colors.textcolor1,
          fontWeight: FontWeight.w700,
          fontSize: 16
        )) ,) ,

            ],
            ),
        ),
      ),
    ); 
    
  }
}












