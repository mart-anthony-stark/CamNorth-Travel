import 'package:flutter/material.dart';

class PostBottomBar extends StatelessWidget {
  const PostBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 50,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "City name, Country",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: TextStyle(color: Colors.black54, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/city5.jpg",
                          fit: BoxFit.cover,
                          width: 120,
                          height: 90,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/city4.jpg",
                          fit: BoxFit.cover,
                          width: 120,
                          height: 90,
                        )),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 90,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/city6.jpg'),
                            fit: BoxFit.cover,
                            opacity: 0.4)),
                    child: const Text(
                      "10+",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 6)
                        ]),
                    child: const Icon(
                      Icons.bookmark_outline,
                      size: 20,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
