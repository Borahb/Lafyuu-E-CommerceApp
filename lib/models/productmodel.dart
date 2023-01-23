// ignore_for_file: public_member_api_docs, sort_constructors_first, null_closures
import 'dart:convert';

class ProductModel {

  static final pModel = ProductModel._internal();

  ProductModel._internal();

  factory ProductModel() => pModel; 


  static List<Product> products = [];

  //get product by id
  Product getById(int id) => products.firstWhere((element) => element.id == id, orElse: null);

  //getproduct by position
  Product getByPosition(int pos) => products[pos];
}





class Product {
  final int id;
  final String name;
  final String image;
  final num price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price
  });


  Product copyWith({
    int? id,
    String? name,
    String? image,
    num? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, price: $price)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode;
  }
}
