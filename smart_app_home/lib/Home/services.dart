import 'package:flutter/material.dart';
import 'package:smart_app_home/Entertainment/entertainment.dart';
import 'package:smart_app_home/Temperature/temperatur.dart';
import 'package:smart_app_home/Water/water.dart';
import 'package:smart_app_home/constants.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardItems(title: "ENERGY", image: "images/energy.png"),
            cardItems(
              onTab: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Temperature()));
              },
              title: "TEMPERATURE",
              image: "images/temperature.png",
              color: Color.fromARGB(255, 229, 121, 121),
              fontColor: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardItems(
              onTab: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WaterScreen()));
              },
              title: "WATER",
              image: "images/water.png",
              color: Color.fromARGB(255, 140, 143, 233),
              fontColor: Colors.white,
            ),
            cardItems(
               onTab: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Entertainment()));
                },
              title: "ENTERTAINMENT",
              image: "images/entertainment.jpg",
              color: Color.fromARGB(255, 239, 140, 94),
              fontColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector cardItems({
    required title,
    required String image,
    VoidCallback? onTab,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Material(
        elevation: 15,
        shadowColor: Colors.white38,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 170,
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 80,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
