import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/bloc/favoriteproductbloc/fproductevent.dart';
import 'package:lafyuu/bloc/favoriteproductbloc/fproductstate.dart';
import 'package:lafyuu/models/favouriteproduct.dart';
import 'package:lafyuu/models/productmodel.dart';

class FpBloc extends Bloc<FProductEvents,FproductState>{

  final _item = FavoriteProductModel();
  final _product = ProductModel();
  

  @override
  FproductState get initialState => Fproductintialstate();

  @override
  Stream<FproductState> mapEventToState(FProductEvents event)async* {
    
    if (event is Fproductadded){ 
      _item.products = _product;
      _item.add(event.product);
      yield Fpadded();      
    }

    if (event is Fproductremoved){
       _item.remove(event.product.items[0]);
       yield Fpremoved();
    }
  }


}