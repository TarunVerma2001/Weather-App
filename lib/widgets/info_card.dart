import 'package:flutter/material.dart';


class infoCard extends StatelessWidget {
  IconData iconName;
  String data;
  infoCard({required this.data, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconName,
          color: Colors.white,
          size: 20.0,
        ),
        Text(
          "$data",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}