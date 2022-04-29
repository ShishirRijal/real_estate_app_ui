import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;
  const IconBox({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.0,
        width: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          size: 30.0,
          color: isSelected ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
