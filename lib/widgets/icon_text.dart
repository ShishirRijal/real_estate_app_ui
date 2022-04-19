import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String title;
  const IconText({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: Colors.black,
        ),
        const SizedBox(width: 3.0),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
