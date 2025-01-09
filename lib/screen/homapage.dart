import 'package:flutter/material.dart';
import 'package:uispeed_grocery_shop/screen/favorite.dart';
import 'package:uispeed_grocery_shop/screen/homescreen.dart';
import 'package:uispeed_grocery_shop/screen/profile.dart';
import 'package:uispeed_grocery_shop/screen/search.dart';


class Homapage extends StatefulWidget {
  const Homapage({super.key});

  @override
  State<Homapage> createState() => _HomapageState();
}

class _HomapageState extends State<Homapage> {
  int selectitem = 0;
  ontabfun() {
    setState(() {
      selectitem;
    });
  }

  int selectiteam = 0;
  static const List<Widget> widgetOption = <Widget>[
    homescreen(),
    MySaerch(),
    Favorite(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectiteam = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOption.elementAt(selectiteam),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueGrey,
          currentIndex: selectiteam,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "farvote",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "profile",
                backgroundColor: Colors.black),
          ]),
    );
  }
}
