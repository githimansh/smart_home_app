import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_app_home/constants.dart';

class Entertainment extends StatefulWidget {
  const Entertainment({super.key});

  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  double volumePercentage = 0.7;
  bool isPlaying = false;

  void _updateVolume(double newVolume) {
    setState(() {
      volumePercentage = newVolume / 100;
    });
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
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
                      percent: volumePercentage,
                      backgroundColor: const Color(0xFFEAE4FF),
                      progressColor: textColor,
                      center: Text(
                        "${(volumePercentage * 100).toInt()}%",
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
                    MediaControls(
                      isPlaying: isPlaying,
                      onPlayPauseToggle: _togglePlayPause,
                    ),
                    const SizedBox(height: 20),
                    VolumeControl(
                      initialVolume: volumePercentage * 100,
                      onVolumeChanged: _updateVolume,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        device(
                          title: "TV",
                          isActive: isPlaying,
                        ),
                        device(
                          title: "SPEAKER",
                          isActive: isPlaying,
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
  final bool isPlaying;
  final VoidCallback onPlayPauseToggle;

  const MediaControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPauseToggle,
  });

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
              GestureDetector(
                onTap: onPlayPauseToggle,
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.blue[800],
                  size: 36,
                ),
              ),
              Icon(Icons.stop, color: Colors.blue[800], size: 36),
            ],
          ),
        ],
      ),
    );
  }
}

class VolumeControl extends StatefulWidget {
  final double initialVolume;
  final ValueChanged<double> onVolumeChanged;

  const VolumeControl({
    super.key,
    required this.initialVolume,
    required this.onVolumeChanged,
  });

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  late double volume;

  @override
  void initState() {
    super.initState();
    volume = widget.initialVolume;
  }

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
                widget.onVolumeChanged(newVolume);
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
