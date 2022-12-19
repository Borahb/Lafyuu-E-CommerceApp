// ignore_for_file: prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/Widgets/categorycard.dart';
import 'package:lafyuu/Utils/Widgets/gridviewcard.dart';
import 'package:lafyuu/Utils/Widgets/productcard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/models/categorymodel.dart';
import 'package:lafyuu/models/productmodel.dart';



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
  int pageno = 0;
  
  

  @override
  Widget build(BuildContext context) {
  
  PageController pageController = PageController();


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

                  // search bar
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right:16),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 290 ,
                          height: 46,
                          child: TextField(
                          
                          decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top:12,bottom:12,left:40,right:16),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                          color: Colors.grey.shade200
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
                        Row(
                          children: [
                            SvgIcon(
                              size: 24,
                              color:colors.textcolor1,
                              icon: const SvgIconData('images/love.svg')
                              ),
                              const SizedBox(width: 16,),
                          GestureDetector(
                          onTap: (){
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              LoggedOut()
                            );
                          },
                          child: SvgIcon(
                            size: 24,
                            color:colors.textcolor1,
                            icon: const SvgIconData('images/Notification.svg')
                            ),
                        )
                          ],
                        ),
                        


                      ],
                    ),
                  ),


                  const SizedBox(
                    height: 16,
                    child: Divider(),
                    ),
                  
                  // horizontal scrollable view

                  usables.banner(
                  pageController,
                  pageno,
                  (index){
                          pageno = index;
                          setState(() {  
                          });
                        }
                  ),

                  Container(height:48),
        
                  usables.resuablerow('Category','More Category'),
                
                  Container(height:12),
        
                  Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: SizedBox(
                    height:167,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: CategoryItem.category.length,
                      itemBuilder: (context, index){
                        return CategoryCard(category: CategoryItem.category[index]);
                      },
                    ),
                  ),
                ),
        
                const SizedBox(height: 24,),
        
                SizedBox(
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
                              return ProductCard(product: ProductModel.products[index]);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 21,),

                SizedBox(
                  height: 271,
                  width: 455,
                  child: Column(
                    children: [
                      usables.resuablerow('Mega Sale','See More'),
                      const SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right:16),
                        child: SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ProductModel.products.length,
                            itemBuilder: (context,index){
                              return ProductCard(product: ProductModel.products[index]);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 8,),
                
                // recomended product
                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: Stack(
                    children:[
                      Container(
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           image: const DecorationImage(
                            image: AssetImage('images/image 51.jpg'),
                            fit: BoxFit.fill,
                            ),
                           //color: colors.backgroundcolor
                        ),
                        height: 206,
                        
                        ),         
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

                const SizedBox(height: 21,),

                Padding(
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
                ),

                const SizedBox(height: 14,),

        
        
              ]
            ),
          ),
        ),
      ),
    );
  }
}