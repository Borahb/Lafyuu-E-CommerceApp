import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Screens/Account/account.dart';
import 'package:lafyuu/Screens/Cart/cart.dart';
import 'package:lafyuu/Screens/Explore/explore.dart';
import 'package:lafyuu/Screens/HomeScreen/home_screen.dart';
import 'package:lafyuu/Screens/Offer/offer.dart';




class Tabbar extends StatefulWidget {
  const Tabbar({ Key? key }) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {

  int _currentindex = 0;
  final tabs = [
    HomeScreen(),
    Explore(),
    Cart(),
    Offer(),
    Account(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label:'Home',
             

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label:'Explore',
             

            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label:'Cart',
             

            ),
            BottomNavigationBarItem(
            icon: SvgIcon(
              icon: SvgIconData('images/Offer.svg',),
              
            ),
            label:'Offer',
             

            ),
            
            BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label:'Account',
             

            ),

        ],
        onTap: (index){
            setState(() {
              _currentindex = index;
            });
        },
      ),

      body: tabs[_currentindex]
    );
  }
}