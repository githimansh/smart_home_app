import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(
          top: 18,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: textColor,
                  ),
                ),
                Image.asset(
                  "images/menu.png",
                  height: 30,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CircularPercentIndicator(
                    radius: 110,
                    lineWidth: 20,
                    percent: 0.65,
                    backgroundColor: Color.fromARGB(255, 217, 213, 233),
                    progressColor: Colors.blue,
                    center: Text(
                      "85%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: 45),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      "WATER LEVEL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      generalAndServices(
                        title: "GENERAL",
                        isActive: true,
                      ),
                      generalAndServices(title: "SERVICES")
                    ],
                  ),
                  const SizedBox(height: 40),
                
                  const PumpSpeed(),
                  const SizedBox(height: 20),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      valve(
                        title: "VALVE 1",
                        isActive: true,
                      ),
                      valve(
                        title: "VALVE 2",
                        isActive: true,
                      ),
                      valve(
                        title: "VALVE 3",

                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Column valve({
    required String title,
    bool isActive = false,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 15,
              shadowColor: Colors.black26,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: isActive ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "images/image.png",
                  fit: BoxFit.cover,
                  width: 50,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 5,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: isActive ? Colors.amber : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black54 : Colors.black26,
          ),
        )
      ],
    );
  }

  Container generalAndServices({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 42,
      ),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryColor),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isActive ? Colors.white70 : Colors.grey,
        ),
      ),
    );
  }
}

class PumpSpeed extends StatefulWidget {
  const PumpSpeed({super.key});

  @override
  _PumpSpeedState createState() => _PumpSpeedState();
}

class _PumpSpeedState extends State<PumpSpeed> {
  double pumpSpeed = 15; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PUMP SPEED",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          Slider(
            value: pumpSpeed,
            onChanged: (newSpeed) {
              setState(() {
                pumpSpeed = newSpeed;
              });
            },
            max: 30,
            min: 0,
            divisions: 30,
            label: "${pumpSpeed.toInt()}",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Low"),
              Text("Medium"),
              Text("High"),
            ],
          ),
        ],
      ),
    );
  }
}
const Color textColor = Colors.black;
const Color primaryColor = Colors.blue;
