// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/FavoriteProductScreen/favouritescreen.dart';
import 'package:lafyuu/Screens/ProductDetailScreen/productdetailscreen.dart';
import 'package:lafyuu/Utils/Widgets/gridviewcard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/bloc/favoriteproductbloc/fproductbloc.dart';
import 'package:lafyuu/models/productmod.dart';
import 'package:lafyuu/models/productmodel.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {

    AppColors colors = AppColors();

    List<Product> _foundProducts = [];

    @override
    initState() {
    _foundProducts = ProductModel.products ;
   // print(_foundProducts);
    super.initState();
    }

    List<Product> results = [];

    void _runFilter(String enteredKeyword) {
      
      if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = ProductModel.products;
      } else {
      results = ProductModel.products
          .where((product) =>
          product.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundProducts = results;
    });

    }

    


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 16,),
              Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchBar()));
                },
                child: SizedBox(
                width: 280,
                height: 46,
                child: TextField(
                  onChanged: (value){
                    _runFilter(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 40, right: 16),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: colors.backgroundcolor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: colors.light)
                    ),
                    
                    hintText: 'Search Product',
                    prefixIcon:
                        IconButton(
                          icon:const Icon(Icons.search), 
                          color: colors.backgroundcolor,
                          onPressed:(){
                            //showSearch(context: context, delegate: ProductSearch() );
                          },
                          )
                          ),
                     ),
                ),
               ),


              const SizedBox(
                   width: 15,
                  ),


              IconButton(onPressed: (){
                print(ProductModel.products);
              }, icon: Icon(Icons.mic))
                  ],
                ),
              ),
              
              const SizedBox(height: 28, child: Divider(),),

              const SizedBox(height: 16,),

              Padding(
                padding: const EdgeInsets.only(left: 16,right:16),
                child: _foundProducts.isNotEmpty ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap:true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing:12,
                      mainAxisExtent: 330,
                      
                      ),
                      itemCount: _foundProducts.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=> ProductDetailScreen(
                                product: ProductModel.products[index],
                                index: index,
                                )));
                          },
                          child: GridCard(product: _foundProducts[index]));
                      },
                      ) : const Text('No results found',style: TextStyle(fontSize: 24),
                        ),
                      )
            ],
          ),
        ),
      ),
    );
  }
}