import 'dart:convert';

import 'package:http/http.dart' as http;

// "api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}"

String url1 = "https://api.openweathermap.org/data/2.5/weather?q=";

String url2 = "https://api.openweathermap.org/data/2.5/weather?";
String apiKey = "7f5482df01d90b90b4f530425e35d138";

class NetworkingByCityName {
  String cityname;
  NetworkingByCityName({required this.cityname});

  Future<List<String>> networking() async {
    var url = Uri.parse(url1 + cityname + "&appid=" + apiKey);
    var respondes = await http.get(url);

    //required data => temp, hmidity , cloudiness, wing
    List<String> arr = [
      "30",
      "95",
      "11",
      "20",
      "200",
      "Strong Rain",
    ];
    String statusCode = respondes.statusCode.toString();
    if(statusCode != "200"){
      arr[0] = arr[1] = arr[2] =arr[3]= arr[4] = "XX";
      arr[5] = "SORRY!!! can't find weather on this location";
      return arr;
    }
    String temperature = (json.decode(respondes.body)["main"]["temp"] - 273.15)
        .toStringAsFixed(1);
    String humidity =
        json.decode(respondes.body)["main"]["humidity"].toString();
    String windSpeed =
        json.decode(respondes.body)["wind"]["speed"].toString(); //  m /sec
    String cloudinessPer =
        json.decode(respondes.body)["clouds"]["all"].toString();
    String weatherDecription =
        json.decode(respondes.body)["weather"][0]["description"].toString();

    
    arr = [
      temperature,
      humidity,
      windSpeed,
      cloudinessPer,
      statusCode,
      weatherDecription
    ];
    return arr;
  }
}

class NetworkingByLatAndLog {
  // String cityname;
  String longitude;
  String latitude;
  NetworkingByLatAndLog({required this.longitude, required this.latitude});

  Future<List<String>> networking() async {
    var url = Uri.parse(url1 + "lat=" + latitude + "&lon=" + longitude + "&appid=" + apiKey);
    var respondes = await http.get(url);

    //required data => temp, hmidity , cloudiness, wing
    List<String> arr = [
      "30",
      "95",
      "11",
      "20",
      "200",
      "Strong Rain",
      "London",
    ];
    print(respondes.statusCode);
    String statusCode = respondes.statusCode.toString();
    if(statusCode != "200"){
      arr[0] = arr[1] = arr[2] =arr[3]= arr[4] = "XX";
      arr[5] = "SORRY!!! can't find weather on this location";
      arr[6] = "Can't Access Location";
      return arr;
    }
    String temperature = (json.decode(respondes.body)["main"]["temp"] - 273.15)
        .toStringAsFixed(1);
    String humidity =
        json.decode(respondes.body)["main"]["humidity"].toString();
    String windSpeed =
        json.decode(respondes.body)["wind"]["speed"].toString(); //  m /sec
    String cloudinessPer =
        json.decode(respondes.body)["clouds"]["all"].toString();
    String weatherDecription =
        json.decode(respondes.body)["weather"][0]["description"].toString();
    String location1 = 
        json.decode(respondes.body)["name"].toString();
    
    arr = [
      temperature,
      humidity,
      windSpeed,
      cloudinessPer,
      statusCode,
      weatherDecription,
      location1,
    ];
    return arr;
  }
}
