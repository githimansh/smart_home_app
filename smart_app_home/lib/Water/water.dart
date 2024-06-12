import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  double waterLevel = 0.65;
  bool isValve1Active = false;
  bool isValve2Active = false;
  bool isValve3Active = false;

  void updateWaterLevel(double pumpSpeed) {
    setState(() {
      waterLevel = pumpSpeed / 30; 

      if (pumpSpeed <= 10) {
        isValve1Active = true;
        isValve2Active = false;
        isValve3Active = false;
      } else if (pumpSpeed <= 20) {
        isValve1Active = false;
        isValve2Active = true;
        isValve3Active = false;
      } else {
        isValve1Active = false;
        isValve2Active = false;
        isValve3Active = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 18,
            left: 10,
            right: 10,
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
                      percent: waterLevel,
                      backgroundColor: Color.fromARGB(255, 217, 213, 233),
                      progressColor: Colors.blue,
                      center: Text(
                        "${(waterLevel * 100).toInt()}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: 45,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        "WATER LEVEL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
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
                    PumpSpeed(onSpeedChanged: updateWaterLevel),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        valve(
                          title: "VALVE 1",
                          isActive: isValve1Active,
                        ),
                        valve(
                          title: "VALVE 2",
                          isActive: isValve2Active,
                        ),
                        valve(
                          title: "VALVE 3",
                          isActive: isValve3Active,
                        ),
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
            ),
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
        ),
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
  final Function(double) onSpeedChanged;

  const PumpSpeed({super.key, required this.onSpeedChanged});

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
              widget.onSpeedChanged(newSpeed);
            },
            max: 30,
            min: 0,
            divisions: 30,
            label: "${pumpSpeed.toInt()}",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
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
