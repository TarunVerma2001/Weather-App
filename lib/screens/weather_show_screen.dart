import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/data.dart';
import 'package:weather_app/networking/weather_api_call.dart';
import 'package:weather_app/screens/cityname_selector.dart';
import 'package:weather_app/widgets/info_card.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:geolocator/geolocator.dart';


List<String> arr = [
  // temperature.toString(),
  // humidity.toString(),
  // windSpeed.toString(),
  // cloudinessPer.toString(),
  // statusCode.toString(),
  "30", "95", "11", "20", "200", "Strong Rain",
];
String location = "London";
String latitude = "";
String longitude = "";
class WeatherShowScreen extends StatefulWidget {
  List<String> tmp;
  String city;
  WeatherShowScreen({required this.tmp, required this.city});
  @override
  _WeatherShowScreenState createState() => _WeatherShowScreenState();
}

class _WeatherShowScreenState extends State<WeatherShowScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      arr = widget.tmp;
      location = widget.city;
    });
  }


  Future getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
  }

  String description = arr[5][0].toUpperCase() + arr[5].substring(1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TopSection()

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      getLocation();
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Loading(location: 'London', type: false, longitude: longitude, latitude: latitude);
                      }));
                    
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.2),
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white10,
                      ),
                      child: Text(
                        location[0].toUpperCase() + location.substring(1),
                        style: (TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      String city = location;
                      city = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityNameSelector();
                            },
                          ),
                        );
                      setState(()  {
                          location = city[0].toUpperCase() + city.substring(1);
                      });
                    },
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30.0,
                    ),
                  ),
                ],
              ),

              //MiddleSection()

              WeatherCard(
                icon: iconType(arr[5][0].toUpperCase() + arr[5].substring(1)),
                startColor: Colors.orange,
                endColor: Colors.yellow,
                description: arr[5][0].toUpperCase() + arr[5].substring(1),
              ),
              //BottomSection()
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // speed
                      infoCard(
                        data: " ${arr[1]} m/sec",
                        iconName: CupertinoIcons.wind,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      infoCard(
                        data: " ${arr[2]}%",
                        iconName: CupertinoIcons.drop,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      infoCard(
                        data: " ${arr[3]}%",
                        iconName: CupertinoIcons.cloud_sun,
                      ),
                    ],
                  ),
                  Text(
                    "${arr[0]}°",
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
