import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: const <Widget>[
        Icon(Icons.person_outline, size: 30),
        Icon(Icons.favorite_outline, size: 30),
        Icon(Icons.home, size: 30, color: Colors.redAccent),
        Icon(Icons.location_city, size: 30),
        Icon(Icons.list, size: 30),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
