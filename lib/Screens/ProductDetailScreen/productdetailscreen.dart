// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/HomeScreen/productview.dart';
import 'package:lafyuu/Utils/Widgets/SizeCard.dart';
import 'package:lafyuu/Utils/Widgets/colorcard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/colormodel.dart';
import 'package:lafyuu/models/productmodel.dart';
import 'package:lafyuu/models/sizemodel.dart';




class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final VoidCallback ontap;
  const ProductDetailScreen({ Key? key, required this.product, required this.ontap}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  AppColors colors = AppColors();
 //Usables usables = Usables();
  int pageno = 0;

  @override
  Widget build(BuildContext context) {

    PageController pagecontroller = PageController();

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
                        Text('Nike Air Max 270 Rea...',style:TextStyle(
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

              //product images
              const SizedBox(height: 16,),
                  
              Column(
                    children: [
                      SizedBox(
                        height:238,                      
                        child: PageView.builder(
                          onPageChanged: (index){                        
                            pageno = index; 
                            setState(() { 
                            });
                          },
                          controller: pagecontroller,
                          itemCount: 5,
                          itemBuilder: (context,index){
                            return AnimatedBuilder(                        
                              animation: pagecontroller, 
                              builder: (context,child){
                                return child!;
                              },
                              child: GestureDetector(
                                onTap: (){},
                                child: Padding(
                                  padding: const EdgeInsets.only(right:8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      
                                      image: DecorationImage(image: AssetImage(widget.product.image),fit: BoxFit.fill),
                                    ),
                                    //margin:const EdgeInsets.all(),
                                    height: 238,
                                   
                                    
                                  ),
                                ),
                              ),
                              );
                          },
                          
                          ),
                      ),
                      const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:List.generate(5, 
                    (index) => Container(
                      margin: const EdgeInsets.all(4.0),
                      child: Icon(Icons.circle,
                      size: 12,
                      color: pageno == index ? colors.backgroundcolor : colors.light,
                      ),
                    )
                    )
                  ),
                    ],
                  ),
                  
                  
              const SizedBox(height:16),

              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: Column(

                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [

                    Productname(colors: colors, name: widget.product.name, ontap: widget.ontap),
                    
                    const SizedBox(height: 8,),

                    Image.asset('images/star.png',width: 96,height: 16,),
                    const SizedBox(height: 16,),

                    Text('Rs 299,43',style: TextStyle(
                          color: colors.backgroundcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),),
                    
                    const SizedBox(height: 24,),

                    Selectsize(colors: colors),

                    const SizedBox(height: 24,),

                    Selectcolor(colors: colors),

                    const SizedBox(height: 24,),

                    Productadd(colors: colors),



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

class Productadd extends StatelessWidget {
  const Productadd({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Specification',style: TextStyle(
        color: colors.textcolor2,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),
      const SizedBox(height: 12,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Shown:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
            Text('Laser',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Text('Blue/Anthracite/Watermel',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            Text('on/White',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Style:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
            Text('CD0113-400',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 12,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Wrap(
          children: [ 
            Text('The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',style: TextStyle(
              color: colors.textcolor2,
              fontSize: 12,
              fontWeight: FontWeight.w400
              ),),]
        ),

        const SizedBox(height: 24,),

        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Review Product:',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),),
            Text('See More',style: TextStyle(
            color: colors.backgroundcolor,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),),
          ],
        ),

        const SizedBox(height: 8,),

        Row(
          children: [
            Image.asset('images/star.png',width: 96,height: 16,),
            const SizedBox(width: 8,),
            Text('4.5',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w700
            ),),
            const SizedBox(width: 3,),
            Text('(5 Review)',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w400
            ),),
          ],
        ),

        const SizedBox(height: 16,),

        Row(
          children: [
            Image.asset('images/Ppic.png', height: 48,width:48),
             const SizedBox(width: 16,),
            Column(
            children: [
            Text('James Lawson',style: TextStyle(
            color: colors.textcolor2,
            fontSize: 14,
            fontWeight: FontWeight.w700
            ),), 
            Image.asset('images/star.png',width: 96,height: 16,),
              ],
            )
          ]

        ),

        const SizedBox(height: 16,),

        Wrap(
          children: [ 
            Text('air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',style: TextStyle(
              color: colors.textcolor1,
              fontSize: 12,
              fontWeight: FontWeight.w400
              ),),]
        ),

        const SizedBox(height: 16,),

        Row(
          children: [
            Image.asset('images/Product Picture02.png', height: 72,width:72),
            const SizedBox(width: 12,),
            Image.asset('images/Product Picture03.png', height: 72,width:72),
            const SizedBox(width: 12,),
            Image.asset('images/Product Picture01.png', height: 72,width:72),
          ]
        ),

        const SizedBox(height: 16,),

        Text('December 10, 2016',style: TextStyle(
            color: colors.textcolor1,
            fontSize: 10,
            fontWeight: FontWeight.w400
            ),),

        const SizedBox(height: 20,),

        const ProductView(name: 'You Might Also Like', name2: ''),

        const SizedBox(height: 21,),

        Container(
        height: 57,
        decoration: BoxDecoration(
        color: colors.backgroundcolor,
        borderRadius: BorderRadius.circular(5)),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        'Add To Cart',
        style: TextStyle(
        color: colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700),
        )
        ],
        ),
        ),

        const SizedBox(height: 25,),

      ],
    );
  }
}

class Selectcolor extends StatelessWidget {
  const Selectcolor({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Select Color',style: TextStyle(
        color: colors.textcolor2,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),
      const SizedBox(height: 12,),
      SizedBox(
        height: 81,
        child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Colormodel.productcolor.length,
          itemBuilder: (context,index){
            return ColorCard(pcolor: Colormodel.productcolor[index]);
          },
        ),
      ),
      ],
    );
  }
}

class Selectsize extends StatelessWidget {
  const Selectsize({
    Key? key,
    required this.colors,
    
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text('Select Size',style: TextStyle(
        color: colors.textcolor2,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),
      const SizedBox(height: 12,),
      SizedBox(
        height: 81,
        child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: SizeModel.size.length,
          itemBuilder: (context,index){
            return SizeCard(size: SizeModel.size[index]);
          },
        ),
      ),
      ],
    );
  }
}

class Productname extends StatelessWidget {
  final VoidCallback ontap;
  final String name;
  const Productname({
    Key? key, required this.name,
    required this.colors,
    required this.ontap
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(name,style: TextStyle(
          color: colors.textcolor2,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        GestureDetector(
          onTap: ontap,
          child: const SvgIcon(icon: SvgIconData('images/love.svg')))
      ]
    );
  }
}


