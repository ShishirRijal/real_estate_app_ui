import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstate_app_ui/screens/home_screen.dart';

import '../models/apartments.dart';

const _images = [
  'assets/images/house.jpg',
  'assets/images/home.jpg',
  'assets/images/banglo.jpg',
  'assets/images/modern_house.jpg',
];

var _currentPageIndex = 0;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),

            Stack(
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.5,
                  width: double.infinity,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          _images[index],
                        ),
                      );
                    },
                    itemCount: _images.length,
                    physics: const PageScrollPhysics(),
                    onPageChanged: (newIndex) {
                      setState(() {
                        _currentPageIndex = newIndex;
                      });
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: (_currentPageIndex + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          TextSpan(
                            text: "/${_images.length}",
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),
            CarouselIndicator(
              activeColor: Colors.black54,
              count: _images.length,
              index: _currentPageIndex,
              color: Colors.grey,
              height: 2,
              width: 20,
              cornerRadius: 20,
            ),

            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Find Your\nSweet Home",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Schedule visits in just a few clicks,\nvisit within a few days.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // const SizedBox(height: 60.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(mediaQuery.width * 0.8, 50),
                ),
              ),
              child: const Text(
                "Get Started",
                // style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ChangeNotifierProvider(
                    create: (context) => Apartments(),
                    child: const HomeScreen(),
                  );
                }));
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
