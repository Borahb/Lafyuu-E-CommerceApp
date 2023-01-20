// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/Cart/cart.dart';
import 'package:lafyuu/Screens/FavoriteProductScreen/favouritescreen.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/bloc/favoriteproductbloc/fproductbloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 243,
            height: 46,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 40, right: 16),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: 'Search Product',
                  prefixIcon:
                      Icon(Icons.search, color: colors.backgroundcolor)),
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
                                child: Cart(),
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
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
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
