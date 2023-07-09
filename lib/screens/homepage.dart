// ignore_for_file: must_be_immutable

import 'package:daex_travel_app/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = "/home";
  List<String> categories = [
    'Best Places',
    'Most Visited',
    'Favorites',
    'New Added',
    'Hotels',
    'Restaurants'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/city${index + 1}.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.7)),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: const Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: const Text(
                                "City name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ]),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      for (int i = 0; i < 6; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 6)
                              ]),
                          child: Text(
                            categories[i],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
