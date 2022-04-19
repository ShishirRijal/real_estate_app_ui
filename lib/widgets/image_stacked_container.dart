import 'package:flutter/material.dart';

class ImageStackedContainer extends StatelessWidget {
  final String title;
  final String imageAddress;
  const ImageStackedContainer({
    Key? key,
    required this.title,
    required this.imageAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // width: mediaQuery.width * 0.5,
          width: 160.0,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          left: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              imageAddress,
              height: 140,
              // width: 160,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          )),
        ),
      ],
    );
  }
}
