// ignore_for_file: must_be_immutable

import 'package:camnorth_travel/screens/post_screen.dart';
import 'package:camnorth_travel/widgets/home_app_bar.dart';
import 'package:camnorth_travel/widgets/home_bottom_bar.dart';
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

  List destinations = [
    {'name': "Calaguas Island", 'rating': 4.5, "img": "assets/calaguas.png"},
    {
      'name': "Pulang Daga Beach",
      'rating': 4.3,
      "img": "assets/pulangdaga.jpg"
    },
    {'name': "Apuao Grande", 'rating': 4.1, "img": "assets/apuao-grande.JPG"},
    {'name': "Bagasbas Beach", 'rating': 5.0, "img": "assets/camnorth-3.jpg"},
    {'name': "City 5", 'rating': 3.9, "img": "assets/city5.jpg"},
    {'name': "City 6", 'rating': 4.8, "img": "assets/city6.jpg"},
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
                    itemCount: destinations.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostScreen()));
                        },
                        child: Container(
                          width: 160,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(destinations[index]['img']),
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
                              child: Text(
                                destinations[index]['name'],
                                style: const TextStyle(
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
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: destinations.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostScreen()));
                          },
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage(destinations[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  destinations[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Icon(Icons.more_vert)
                              ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text("${destinations[index]['rating'].toString()}")
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
