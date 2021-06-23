import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/weather_show_screen.dart';
import 'networking_engine.dart';

class Loading extends StatefulWidget {
  String location = "London";
  String latitude;
  String longitude;
  bool type = true;
  Loading({required this.location, required this.type, required this.longitude, required this.latitude});
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    solve();
  }

  void solve() async {
    List<String> tmp = [
      "30",
      "95",
      "11",
      "20",
      "200",
      "Strong Rain",
    ];
    List<String> tmp2 = [
      "30",
      "95",
      "11",
      "20",
      "200",
      "Strong Rain",
      "London",
    ];
    if(widget.type == true){
      tmp = await NetworkingByCityName(cityname: widget.location).networking();
    } else{
      tmp2 = await NetworkingByLatAndLog(latitude: widget.latitude, longitude: widget.longitude).networking();
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherShowScreen(tmp: widget.type ? tmp : tmp2, city: widget.type ? widget.location : tmp2[6]);
    }));
  }

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
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
