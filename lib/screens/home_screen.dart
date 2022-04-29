import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstate_app_ui/screens/detail_screen.dart';
import '../models/apartment.dart';
import '../models/apartments.dart';
import '../constants.dart';
import '../widgets/apartment_card.dart';
import '../widgets/clickable_underlined_text.dart';
import '../widgets/image_stacked_container.dart';

class Action {
  final String title;
  final String imageAddress;
  Action(this.title, this.imageAddress);
}

List<Action> _actions = [
  Action('Buy a home', "assets/images/country_home.jpg"),
  Action('Rent a home', "assets/images/mansion.jpg"),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPopularSelected = true;
  bool _isRecommendedSelected = false;
  bool _isNearestSelected = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final apartments =
        Provider.of<Apartments>(context, listen: false).apartments;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Location",
                            style: kInactiveText,
                          ),
                          // const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Text(
                                "Canada",
                                style: kActiveText,
                              ),
                              IconButton(
                                icon: const Icon(Icons.expand_more,
                                    size: 30.0, color: Colors.black),
                                onPressed: () {
                                  /// expand
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 25.0,
                        child: Image.asset('assets/images/girl.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: mediaQuery.width * 0.7,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const TextField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            hintText: 'Search address, city, location',
                            hintStyle: kInactiveText,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: min(mediaQuery.width * 0.14, 50),
                        width: min(mediaQuery.width * 0.14, 50),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.settings,
                            size: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 220.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const SizedBox(width: 10.0),
                            ImageStackedContainer(
                              title: _actions[index].title,
                              imageAddress: _actions[index].imageAddress,
                            ),
                            const SizedBox(width: 10.0)
                          ],
                        );
                      },
                      itemCount: _actions.length,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClickableUnderlinedText(
                          title: 'Popular',
                          isSelected: _isPopularSelected,
                          onClicked: () {
                            setState(() {
                              _isPopularSelected = true;
                              _isRecommendedSelected = false;
                              _isNearestSelected = false;
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        ClickableUnderlinedText(
                          title: 'Recommended',
                          isSelected: _isRecommendedSelected,
                          onClicked: () {
                            setState(() {
                              _isPopularSelected = false;
                              _isRecommendedSelected = true;
                              _isNearestSelected = false;
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        ClickableUnderlinedText(
                          title: 'Nearest',
                          isSelected: _isNearestSelected,
                          onClicked: () {
                            setState(() {
                              _isPopularSelected = false;
                              _isRecommendedSelected = false;
                              _isNearestSelected = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var currentApartment = apartments[index];
                      return Column(
                        children: [
                          const SizedBox(height: 20.0),
                          ApartmentCard(
                            id: currentApartment.id,
                            imageAddress: currentApartment.imageAddress,
                            city: currentApartment.city,
                            amount: currentApartment.amount,
                            address: currentApartment.address,
                            beds: currentApartment.beds,
                            baths: currentApartment.baths,
                            onClicked: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ChangeNotifierProvider<Apartment>.value(
                                  value: currentApartment,
                                  child:
                                      DetailScreen(apartment: currentApartment),
                                );
                              }));
                            },
                            length: apartments.length,
                          ),
                        ],
                      );
                    },
                    itemCount: apartments.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
