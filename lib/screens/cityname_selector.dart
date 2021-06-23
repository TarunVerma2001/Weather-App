import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/networking/weather_api_call.dart';

class CityNameSelector extends StatefulWidget {
  @override
  _CityNameSelectorState createState() => _CityNameSelectorState();
}

class _CityNameSelectorState extends State<CityNameSelector> {
  String location = "London";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.black,
                Colors.black87,
              ]),
        ),
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 100),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Location",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.location,
                  color: Colors.lightBlueAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                location = value;
                // print(location);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Loading(location: location, type: true, latitude: "qwe", longitude: "qwe",);
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Get Info",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
