import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_app_home/constants.dart';

class Energy extends StatefulWidget {
  const Energy({super.key});

  @override
  _EnergyState createState() => _EnergyState();
}

class _EnergyState extends State<Energy> {
  double energyUsagePercentage = 0.65;
  bool isHeaterOn = false;
  bool isACOn = false;
  bool isLightsOn = false;

  void _toggleDevice(String device) {
    setState(() {
      if (device == 'Heater') {
        isHeaterOn = !isHeaterOn;
      } else if (device == 'AC') {
        isACOn = !isACOn;
      } else if (device == 'Lights') {
        isLightsOn = !isLightsOn;
      }
    });
  }

  void _updateEnergyUsage(double newUsage) {
    setState(() {
      energyUsagePercentage = newUsage / 100;
      isACOn = energyUsagePercentage > 0.60;
      isHeaterOn = energyUsagePercentage > 0.40;
      isLightsOn = energyUsagePercentage > 0.10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
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
                      radius: 100,
                      lineWidth: 20,
                      percent: energyUsagePercentage,
                      backgroundColor: const Color(0xFFEAE4FF),
                      progressColor: textColor,
                      center: Text(
                        "${(energyUsagePercentage * 100).toInt()}%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            fontSize: 40),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "ENERGY USAGE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        generalAndServices(
                          title: "GENERAL",
                          isActive: true,
                        ),
                        generalAndServices(title: "ENERGY")
                      ],
                    ),
                    const SizedBox(height: 40),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ENERGY CONTROL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue[800],
                            ),
                          ),
                          Slider(
                            value: energyUsagePercentage * 100,
                            onChanged: (newUsage) {
                              _updateEnergyUsage(newUsage);
                            },
                            max: 100,
                            min: 0,
                            divisions: 20,
                            label: "${(energyUsagePercentage * 100).toInt()}",
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
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        device(
                          title: "HEATER",
                          isActive: isHeaterOn,
                          onToggle: () => _toggleDevice('Heater'),
                        ),
                        device(
                          title: "AC",
                          isActive: isACOn,
                          onToggle: () => _toggleDevice('AC'),
                        ),
                        device(
                          title: "LIGHTS",
                          isActive: isLightsOn,
                          onToggle: () => _toggleDevice('Lights'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column device({
    required String title,
    required bool isActive,
    required VoidCallback onToggle,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Stack(
            children: [
              Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 15,
                shadowColor: Colors.black26,
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: isActive ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.devices_other,
                    color: isActive ? Colors.white : primaryColor,
                    size: 50,
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
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

const Color textColor = Colors.black;
const Color primaryColor = Colors.blue;
