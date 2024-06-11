import 'package:flutter/material.dart';
import 'package:smart_app_home/Home/services.dart';
import 'package:smart_app_home/constants.dart';

class SmartHomePage extends StatefulWidget {
  const SmartHomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SmartHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 15),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person),
                  Text(
                    "Hi Himanshu",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Image.asset(
                      "images/menu.png",
                      height: 35,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      'images/home1.jpg',
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Smart Home",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "SERVICES",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                   const Services(),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}