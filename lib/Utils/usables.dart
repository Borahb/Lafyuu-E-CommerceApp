import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';

class Usables {

 AppColors colors = AppColors();

// Category Card
  Widget categoryCard (String image, String product) => Column(
      children: [
        CircleAvatar(
          radius: 46,
          backgroundColor: colors.light,
          child: CircleAvatar(
              radius: 45,
              backgroundColor: colors.white,
              child: Center(
                child: Image.asset(image, height: 24, width: 24)
              ),
          ),
        ),
        const SizedBox(height: 8,),
        Text(product, style: TextStyle(
          color: colors.textcolor1,
          fontSize: 10
        )),
      ],
    );

// Resuable Row
  Widget resuablerow (String name1, String name2) => Padding(
        padding: const EdgeInsets.only(left: 16,right:16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(name1, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors.textcolor2,
              fontSize: 14
            ),),
            Text(name2, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colors.backgroundcolor,
              fontSize: 14
            ),)
          ]
        ),
      );

// Product Card
  Widget productcard (String image) => Container(
      height:231 ,
      width: 141,
      
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.light),
        borderRadius: BorderRadius.circular(5)
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,height: 109,width:109),
            const SizedBox(height: 8,),
            Text('FS - Nike Air\nMax 270 React...',style: TextStyle(
              color: colors.textcolor2,
              fontSize: 12,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 8,),
            Text('Rs 299,43',style: TextStyle(
              color: colors.backgroundcolor,
              fontSize: 12,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 8,),
            Row(
              children: [
                Text('Rs 534,33',style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: colors.textcolor1,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(width: 8,),
                Text('24% Off',style: TextStyle(
                  color: colors.errorcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
              ],
            ),
          ],
        ),
      ),
    );

// Product Card 2
  Widget productcard2 (String image) => Container(
      height:282 ,
      width: 165,
      
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.light),
        borderRadius: BorderRadius.circular(5)
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,height: 133,width:133),
            const SizedBox(height: 8,),
            Text('FS - Nike Air\nMax 270 React...',style: TextStyle(
              color: colors.textcolor2,
              fontSize: 12,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 8,),
            Text('Rs 299,43',style: TextStyle(
              color: colors.backgroundcolor,
              fontSize: 12,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 8,),
            Row(
              children: [
                Text('Rs 534,33',style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: colors.textcolor1,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(width: 8,),
                Text('24% Off',style: TextStyle(
                  color: colors.errorcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),),
              ],
            ),
          ],
        ),
      ),
    );

// Banner
  Widget banner (PageController pageController,int pageno,ValueChanged<int> onchanged,) => Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: const SizedBox(height: 16,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right:16),
                    child: SizedBox(
                      height:206,                      
                      child: PageView.builder(
                        onPageChanged: onchanged,
                        controller:pageController,
                        itemCount: 5,
                        itemBuilder: (context,index){
                          return AnimatedBuilder(                        
                            animation: pageController, 
                            builder: (context,child){
                              return child!;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //margin:const EdgeInsets.all(),
                              height: 206,
                              child: Image.asset('images/Offer Banner.jpg',fit: BoxFit.fill,),
                              
                            ),
                            );
                        },
                        
                        ),
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
    );


}