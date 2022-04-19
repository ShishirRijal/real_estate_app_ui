import 'package:flutter/cupertino.dart';

import 'apartment.dart';

class Apartments with ChangeNotifier {
  final List<Apartment> _apartments = [
    Apartment(
      id: '108Austin',
      imageAddress: 'assets/images/banglo.jpg',
      city: "Austin",
      amount: 15400000,
      address: "108 Street, Central Austin, Texas",
      beds: 3,
      baths: 2,
      area: 110,
      rating: 4.6,
      ratingCount: 122,
    ),
    Apartment(
      id: '14NewYork',
      imageAddress: 'assets/images/home.jpg',
      city: 'New York',
      amount: 75000000,
      address: '14 Street, Central Church, NewYork',
      beds: 4,
      baths: 4,
      area: 150,
      rating: 4.9,
      ratingCount: 478,
    ),
    Apartment(
      id: '109BuffalloEast',
      imageAddress: 'assets/images/house.jpg',
      city: "Buffallo",
      amount: 10100000,
      address: '109 Street, East Buffallo, New York',
      beds: 2,
      baths: 1,
      area: 80,
      rating: 3.8,
      ratingCount: 42,
    ),
    Apartment(
      id: '118EdmonCentral',
      imageAddress: 'assets/images/modern_house.jpg',
      city: 'Central Edmon',
      amount: 14000000,
      address: '118 Street, West Edmon, Alberta',
      beds: 2,
      baths: 2,
      area: 100,
      rating: 4.2,
      ratingCount: 214,
    ),
  ];
  get apartments {
    return [..._apartments];
  }

  findApartmentById(String id) {
    return apartments.firstWhere((apartment) => apartment.id == id);
  }
}
