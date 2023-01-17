import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/models/favouriteproduct.dart';
import 'package:lafyuu/models/productmodel.dart';

class Productname extends StatefulWidget {
  final String name;
  final Product product;
  const Productname({
    Key? key, required this.name,
    required this.colors,
    required this.product
  }) : super(key: key);

  final AppColors colors;

  @override
  State<Productname> createState() => _ProductnameState();
}
class _ProductnameState extends State<Productname> {

  final _item = FavoriteProductModel();
  final _product = ProductModel();
  

  @override
  Widget build(BuildContext context) {
    bool isinfav = _item.items.contains(widget.product) ?? false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(widget.name,style: TextStyle(
          color: widget.colors.textcolor2,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        GestureDetector(
          onTap: (){
              if(!isinfav){
            _item.products = _product;
             _item.add(widget.product);
              }
             setState(() {
               
             });
          },
          child: isinfav ? SvgIcon(icon: const SvgIconData('images/iconmonstr-favorite-3.svg'),color: widget.colors.errorcolor ): SvgIcon(icon: const SvgIconData('images/iconmonstr-heart-thin3-1.svg'),color: widget.colors.textcolor1 )
          )
      ]
    );
  }
}