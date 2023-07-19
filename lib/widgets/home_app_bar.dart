import 'package:camnorth_travel/screens/user_location_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 6)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.sort_rounded,
                size: 24,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(UserLocationScreen.routeName);
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.deepOrange[400],
                ),
                const Text(
                  'Camarines Norte, Bicol',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 6)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.search,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
