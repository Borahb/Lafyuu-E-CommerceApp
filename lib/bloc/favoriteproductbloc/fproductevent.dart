import 'package:lafyuu/models/favouriteproduct.dart';
import 'package:lafyuu/models/productmodel.dart';

abstract class FProductEvents{}


class Fproductadded extends FProductEvents{

  final Product product;
  Fproductadded({required this.product});
}

class Fproductremoved extends FProductEvents{
  final FavoriteProductModel product;
  Fproductremoved({required this.product});
}
