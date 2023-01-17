// ignore_for_file: prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe, prefer_const_constructors
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/HomeScreen/Components/categoryview.dart';
import 'package:lafyuu/Screens/HomeScreen/Components/gridview.dart';
import 'package:lafyuu/Screens/HomeScreen/Components/productview.dart';
import 'package:lafyuu/Screens/HomeScreen/Components/searchbar.dart';
import 'package:lafyuu/Screens/OfferScreen/offerscreen.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/Utils/Widgets/usables.dart';
import 'package:lafyuu/models/favouriteproduct.dart';
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
  final _product = ProductModel();
  final _item = FavoriteProductModel();


  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData ()async{
    await Future.delayed(const Duration(seconds: 2));
    final productdata = await rootBundle.loadString('assets/products.json');
    final decodeddata = jsonDecode(productdata);
    var product = decodeddata["products"];
    ProductModel.products =  List.from(product)
    .map<Product>((item) => Product.fromMap(item)).toList();
    setState(() {
      
    });
  }
  
  

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

      body: (ProductModel.products != null && ProductModel.products.isNotEmpty) ? SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children:[                 
                const SizedBox(height: 16,),
                // search bar
                SearchBar(),

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
                        },
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OfferScreen()));
                  }
                  ),

                Container(height:48),
        
                CategoryView(),
        
                const SizedBox(height: 24,),
        
                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: ProductView(name: 'Flash Sale', name2: 'See more'),
                ),

                const SizedBox(height: 21,),

                Padding(
                  padding: const EdgeInsets.only(left: 16,right:16),
                  child: ProductView(name: 'Mega Sale', name2: 'See more'),
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

                ProductGridView(),

                const SizedBox(height: 14,),

        
        
              ]
            ),
          ),
        ),
      ) : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}