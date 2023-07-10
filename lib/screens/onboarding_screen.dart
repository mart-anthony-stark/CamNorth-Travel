import 'package:camnorth_travel/screens/homepage.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/camnorth-3.jpg"),
              fit: BoxFit.cover,
              opacity: 0.7)),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultTextStyle(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              child: Text(
                "Enjoy",
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            DefaultTextStyle(
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 35,
                  letterSpacing: 1.5),
              child: const Text(
                "& explore Daet!",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            DefaultTextStyle(
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                  letterSpacing: 1.2),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomePage()));
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
