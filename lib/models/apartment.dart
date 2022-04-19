import 'package:flutter/cupertino.dart';

class Apartment with ChangeNotifier {
  final String id;
  final String imageAddress;
  final String city;
  final int amount;
  final String address;
  final int beds;
  final int baths;
  final int area;
  final double rating;
  final int ratingCount;
  bool isFavourite;

  Apartment({
    required this.id,
    required this.imageAddress,
    required this.city,
    required this.amount,
    required this.address,
    required this.beds,
    required this.baths,
    required this.area,
    required this.rating,
    required this.ratingCount,
    this.isFavourite = false,
  });

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
