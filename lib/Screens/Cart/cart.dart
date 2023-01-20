import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/Screens/Cart/Components/appbar.dart';
import 'package:lafyuu/Screens/Cart/Components/billspecification.dart';
import 'package:lafyuu/Screens/Cart/Components/cartproduct.dart';
import 'package:lafyuu/Screens/Cart/Components/checkoutbutton.dart';
import 'package:lafyuu/Screens/Cart/Components/coupobbar.dart';
import 'package:lafyuu/Screens/Cart/Components/totalprice.dart';
import 'package:lafyuu/Utils/colors.dart';


class Cart extends StatelessWidget {
  Cart({ Key? key }) : super(key: key);


  final AppColors colors = AppColors();
  

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

                Padding(
                  padding: const EdgeInsets.only(left:16,right:16,),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap:true,
                        itemCount: 2,
                        itemBuilder: (context,index){
                          return CartProduct(colors: colors);
                        }),

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
                              Billspecification(colors: colors,spec1:'Items (3)' ,spec2:'Rs 598',),

                              const SizedBox(height: 16,),

                              Billspecification(colors: colors,spec1:'Shipping' ,spec2:'Rs 598',),

                              const SizedBox(height: 16,),

                              Billspecification(colors: colors,spec1:'Import charges' ,spec2:'Rs 598',),
                      
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(height: 16,
                                child: Divider(color:colors.light,)),
                              ),

                              Totalprice(colors: colors,spec1: 'Total Price', spec2: 'Rs 128',)
                             
                          ],),
                        ),
                      ),

                      const SizedBox(height: 16,),

                      Checkoutbutton(colors: colors)

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












