
import 'package:lafyuu/models/productmodel.dart';

class FavoriteProductModel {

  static final favModel = FavoriteProductModel._internal();

  FavoriteProductModel._internal();

  factory FavoriteProductModel() => favModel; 



  // Product field
  late ProductModel _product;

  
  // collection of ids - store ids of each product
  final List<int> _productid = [];

  // get product
  ProductModel get products => _product;

  set products(ProductModel newproduct){
    assert(newproduct != null);
    _product = newproduct;
  }


  //get items in favoriteproduct
  List<Product> get items => _productid.map((id) => _product.getById(id)).toList();

  //add product

  void add (Product product){
    _productid.add(product.id);
  }

  //Remove product

  void remove (Product product){
    _productid.remove(product.id);
  }


}