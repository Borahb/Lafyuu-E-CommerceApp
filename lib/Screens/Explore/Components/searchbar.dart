// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/FavoriteProductScreen/favouritescreen.dart';
import 'package:lafyuu/Screens/Searchbar/searchbar.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/bloc/favoriteproductbloc/fproductbloc.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchBar()));
            },
            child: Container(
              width: 243,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colors.light)
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16,),
                  Icon(Icons.search,color:colors.backgroundcolor),
                  const SizedBox(width: 8,),
                  Text('Search Product',style: TextStyle(
                    color: colors.textcolor1,
                    fontSize: 12
                  ),)
                ],
              )
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => FpBloc(),
                                child: FavoriteProduct(),
                              )));
                },
                child: SvgIcon(
                    size: 24,
                    color: colors.textcolor1,
                    icon: const SvgIconData('images/love.svg')),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                 // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
                child: SvgIcon(
                    size: 24,
                    color: colors.textcolor1,
                    icon: const SvgIconData('images/Notification.svg')),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class ProductSearch extends SearchDelegate<String>{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [IconButton(icon: const Icon(Icons.clear), onPressed: (){},)];
    
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon:AnimatedIcons.menu_arrow , 
//         progress: transitionAnimation,), 
//         onPressed:(){});
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }

// }
