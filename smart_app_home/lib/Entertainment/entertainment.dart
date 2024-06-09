import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_app_home/constants.dart';

class Entertainment extends StatelessWidget {
  const Entertainment({super.key});

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
                      percent: 0.8,
                      backgroundColor: const Color(0xFFEAE4FF),
                      progressColor: textColor,
                      center: Text(
                        "70%",
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
                        "VOLUME",
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
                        generalAndServices(title: "MEDIA")
                      ],
                    ),
                    const SizedBox(height: 40),
                    const MediaControls(),
                    const SizedBox(height: 20),
                    const VolumeControl(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        device(
                          title: "TV",
                          isActive: true,
                        ),
                        device(
                          title: "SPEAKER",
                          isActive: true,
                        ),
                        device(
                          title: "LIGHTS",
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

class MediaControls extends StatelessWidget {
  const MediaControls({super.key});

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
            "MEDIA CONTROLS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.play_arrow, color: Colors.blue[800], size: 36),
              Icon(Icons.pause, color: Colors.blue[800], size: 36),
              Icon(Icons.stop, color: Colors.blue[800], size: 36),
            ],
          ),
        ],
      ),
    );
  }
}

class VolumeControl extends StatefulWidget {
  const VolumeControl({super.key});

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double volume = 20; // Initial volume level

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
            "VOLUME CONTROL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          Slider(
            value: volume,
            onChanged: (newVolume) {
              setState(() {
                volume = newVolume;
              });
            },
            max: 100,
            min: 0,
            divisions: 20,
            label: "${volume.toInt()}",
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
