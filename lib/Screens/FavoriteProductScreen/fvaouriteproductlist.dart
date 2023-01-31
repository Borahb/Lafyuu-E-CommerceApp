import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/favouriteproduct.dart';

class FavouriteProductlist extends StatefulWidget {
  const FavouriteProductlist({ Key? key }) : super(key: key);

  @override
  State<FavouriteProductlist> createState() => _FavouriteProductlistState();
}

class _FavouriteProductlistState extends State<FavouriteProductlist> {

  AppColors colors = AppColors();
   final _product = FavoriteProductModel();
   
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:16,right:16),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap:true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing:12,
          mainAxisExtent: 300,
          
          ),
          itemCount: _product.items.length,
          itemBuilder: (context,index){
            return Container(
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
              Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(_product.items[index].image),
                fit: BoxFit.fill
                  )
              ),
              ),
              const SizedBox(height: 8,),
              Text(_product.items[index].title,style: TextStyle(
                color: colors.textcolor2,
                fontSize: 12,
                fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 4,),
              Image.asset('images/star.png',width: 68,height: 12,),
              const SizedBox(height: 16,),
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
                    fontSize: 10,
                    fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(width: 8,),
                  Text('24% Off',style: TextStyle(
                    color: colors.errorcolor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(width:13 ,),
                  GestureDetector(
                    onTap: (){
                      _product.remove(_product.items[index]);
                      setState(() {});
                    },
                    child: Icon(Icons.delete,color: colors.textcolor1,size: 18,)
                    )
                ],
              ),

            ],
          ),
        )
      );
                        },
                        ),
                    );
  }
}