import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/Widgets/gridviewcard.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/productmodel.dart';





class OfferScreen extends StatelessWidget {
  const OfferScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 26,),
              Padding(
                padding: const EdgeInsets.only(left:16,right:16),
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
                    Text('Super Flash Sale',style:TextStyle(
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
              const SizedBox(
                    height: 28,
                    child: Divider(),
                    ),
              Padding(
                padding: const EdgeInsets.only(left:16,right:16),
                child: Column(
                  children: [
                    Container(
                      height: 206,
                     
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/Offer Banner.jpg'),
                          fit: BoxFit.fill
                          )
                      ),
                    ),
                  const SizedBox(height: 16,),
                  
                  GridView.builder(
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}