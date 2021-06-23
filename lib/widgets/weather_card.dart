import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_icons/cupertino_icons.dart';

class WeatherCard extends StatelessWidget {
  Color startColor;
  Color endColor;
  String description;
  IconData icon;
  WeatherCard({required this.endColor, required this.startColor, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                startColor,
                endColor,
              ]).createShader(bounds),
          child: Icon(
            icon,
            size: 150,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20,),
        Text("$description", style: TextStyle(color: Colors.grey, fontSize: 20),),
      ],
    );
  }
}
