import 'package:flutter/material.dart';

class ClickableUnderlinedText extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onClicked;
  const ClickableUnderlinedText({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onClicked,
          child: Text(
            title,
            style: isSelected
                ? const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )
                : const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
          ),
        ),
        const SizedBox(height: 8.0),
        if (isSelected)
          Container(
            width: 80.0,
            height: 2.0,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
      ],
    );
  }
}
