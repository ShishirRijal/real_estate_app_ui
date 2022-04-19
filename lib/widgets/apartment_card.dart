import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

import '../constants.dart';
import 'icon_text.dart';

class ApartmentCard extends StatelessWidget {
  final String imageAddress;
  final String city;
  final int amount;
  final VoidCallback onClicked;
  final String address;
  final int beds;
  final int baths;
  final int length;

  const ApartmentCard({
    Key? key,
    required this.imageAddress,
    required this.city,
    required this.amount,
    required this.onClicked,
    required this.address,
    required this.beds,
    required this.baths,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: double.parse(amount.toString()),
    );
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: onClicked,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 350),
        child: Container(
          // alignment: Alignment.centerLeft,
          // height: 350.0,
          width: mediaQuery.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  height: 200,
                  width: mediaQuery.width * 1,
                  imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: Text(
                              city,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "\$${fmf.output.withoutFractionDigits}",
                              style: TextStyle(
                                color: Colors.blue[300],
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(address, style: kInactiveText),
                    const SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconText(
                            icon: Icons.bedroom_child, title: beds.toString()),
                        IconText(icon: Icons.bathtub, title: baths.toString()),
                        IconText(
                            icon: Icons.aspect_ratio_outlined,
                            title: "${length}m"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
