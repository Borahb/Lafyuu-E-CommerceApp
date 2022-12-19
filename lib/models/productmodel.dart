
class ProductModel {
  static final products = [
    Product(id: 1, image: 'images/P1.jpg', name: 'FS - Nike Air\nMax 270 React...'),
    Product(id: 2, image: 'images/P2.jpg', name: 'FS - Nike Air\nMax 270 React...'),
    Product(id: 3, image: 'images/P3.jpg', name: 'FS - Nike Air\nMax 270 React...'),
    Product(id: 4, image: 'images/mega1.jpg', name: 'FS - Nike Air\nMax 270 React...'),
    Product(id: 5, image: 'images/mega3.jpg', name: 'FS - Nike Air\nMax 270 React...'),
    Product(id: 6, image: 'images/mega3.jpg', name: 'FS - Nike Air\nMax 270 React...'),
  ];
}





class Product {
  final int id;
  final String name;
  final String image;

  Product({required this.id, required this.image, required this.name});
}