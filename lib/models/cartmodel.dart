
import 'package:lafyuu/models/productmod.dart';
import 'package:lafyuu/models/productmodel.dart';

class CartProductModel {

  static final favModel = CartProductModel._internal();

  CartProductModel._internal();

  factory CartProductModel() => favModel; 



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

  // get total price

  num get totalPrice => 
    items.fold(0, (total, current) => total + current.price);
  
  
  
  //add product

  void add (Product product){
    _productid.add(product.id);
  }

  //Remove product

  void remove (Product product){
    _productid.remove(product.id);
  }


}