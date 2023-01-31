import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/productmod.dart';
import 'package:lafyuu/models/productmodel.dart';

class ProductImages extends StatefulWidget {
  final AppColors colors;
  final Product product;
  const ProductImages({ Key? key,required this.product, required this.colors }) : super(key: key);

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  
  int pageno = 0;

  @override
  Widget build(BuildContext context) {
    PageController pagecontroller = PageController();
    return Column(
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
                                      
                                      image: DecorationImage(image: NetworkImage(widget.product.image),fit: BoxFit.fill),
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
                      color: pageno == index ? widget.colors.backgroundcolor : widget.colors.light,
                      ),
                    )
                    )
                  ),
                    ],
                  );
  }
}