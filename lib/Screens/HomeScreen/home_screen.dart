// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/colors.dart';


import 'package:lafyuu/Utils/usables.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode search = FocusNode();

  AppColors colors = AppColors();

  TextEditingController searchcontroller = TextEditingController();

  Usables usables = Usables();

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label:'Home',
             

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label:'Explore',
             

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label:'Cart',
             

            ),
            BottomNavigationBarItem(
            icon: SvgIcon(
              icon: SvgIconData('images/Offer.svg',),
              
            ),
            label:'Offer',
             

            ),
            
            BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label:'Account',
             

            ),

        ],
        onTap: (index){
            setState(() {
              _currentindex = index;
            });
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children:[
                  
                  const SizedBox(height: 16,),

                  Padding(
                    padding: const EdgeInsets.only(left: 16,right:16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 265 ,
                          height: 46,
                          child: TextField(
                          
                          decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top:12,bottom:12,left:40,right:16),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                          color: colors.light
                            )
                            ),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
              
                            ),
                          hintText: 'Search Product',
                          prefixIcon: Icon(Icons.search, color: colors.backgroundcolor)
                            ),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        SvgIcon(
                          size: 24,
                          color:colors.textcolor1,
                          icon: SvgIconData('images/love.svg')
                          ),
                        const SizedBox(width: 16,),
                        SvgIcon(
                          size: 24,
                          color:colors.textcolor1,
                          icon: SvgIconData('images/Notification.svg')
                          )


                      ],
                    ),
                  ),


                  const SizedBox(
                    height: 16,
                    child: Divider(),
                    ),
                  // horizontal scrollable view
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Container(
                        height:206,
                        
                        
                        child: Image.asset('images/Offer Banner.jpg'),
                      ),
                    ),
                  ),
                  Container(height:48),
        
                  usables.resuablerow('Category','More Category'),
                
                  Container(height:12),
        
                  Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: SizedBox(
                    height:150 ,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children : [
                        usables.categoryCard('images/shirt.png', 'Man Shirt'),
                        const SizedBox(width: 12,),
                        usables.categoryCard('images/dress.png', 'Dress'),
                        const SizedBox(width: 12,),
                        usables.categoryCard('images/man bag.png', 'Man Work\nEquipment'),
                        const SizedBox(width: 12,),
                        usables.categoryCard('images/woman bag.png', 'Woman Bag'),
                        const SizedBox(width: 12,),
                        usables.categoryCard('images/shirt.png', 'Shoe'),
                      ]
                    ),
                  ),
                ),
        
                const SizedBox(height: 24,),
        
                Container(
                  height: 271,
                  width: 455,
                  child: Column(
                    children: [
                      usables.resuablerow('Flash Sale','See More'),
                      const SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right:16),
                        child: Container(
                          height: 240,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              usables.productcard('images/image Product.jpg'),
                              const SizedBox(width: 12,),
                              usables.productcard('images/image Product2.jpg'),
                              const SizedBox(width: 12,),
                              usables.productcard('images/image Product3.jpg'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 21,),

                Container(
                  height: 271,
                  width: 455,
                  child: Column(
                    children: [
                      usables.resuablerow('Mega Sale','See More'),
                      const SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right:16),
                        child: Container(
                          height: 240,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              usables.productcard('images/mega1.jpg'),
                              const SizedBox(width: 12,),
                              usables.productcard('images/mega2.jpg'),
                              const SizedBox(width: 12,),
                              usables.productcard('images/mega3.jpg'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 9,),

                Container(
                  width: 343,
                  height: 206,
                  child: Stack(
                    children:[
                      Image.asset('images/image 51.jpg'),
                      Positioned(
                        top: 48,
                        left:24,
                        right: 150,
                        bottom:86,
                        child: Text('Recomended\nProduct', style:TextStyle(
                          color:colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700
                        )),
                      ),

                      Positioned(
                        top: 136,
                        left: 24,
                        right: 111,
                        bottom: 48,
                        child: Text('We recommend the best for you', style:TextStyle(
                          color:colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        )),
                      ),

                    ]
                  ),
                ),

                const SizedBox(height: 16,),

                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      usables.productcard2('images/ratep1.jpg'),
                      const SizedBox(width: 16,),
                      usables.productcard2('images/ratep2.jpg'),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16,top:12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      usables.productcard2('images/ratep3.jpg'),
                      const SizedBox(width: 16,),
                      usables.productcard2('images/image Product3.jpg'),
                    ]
                  ),
                ),

                const SizedBox(height: 14,),


                // GridView(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   // crossAxisSpacing: 13,
                //   // mainAxisSpacing:12
                //   ),
                //   children: [
                //     usables.productcard('images/ratep1.jpg'),
                //     usables.productcard('images/ratep2.jpg'),
                //     usables.productcard('images/ratep3,jpg'),
                //     usables.productcard('images/image Product3.jpg'),
                //   ],
                //   ),

                

        
        
              ]
            ),
          ),
        ),
      ),
    );
  }
}