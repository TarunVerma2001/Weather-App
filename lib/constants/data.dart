import 'package:flutter/cupertino.dart';



IconData iconType(String description){
  IconData temp = CupertinoIcons.sun_max_fill;
  switch (description) {
    case "Clear sky": {temp = CupertinoIcons.sun_max_fill;}
      break;
    case "Few clouds": { temp = CupertinoIcons.cloud_sun_fill;}
      break;
    case "Scattered clouds": {temp = CupertinoIcons.cloud_fill;}
      break;
    case "Broken clouds": {temp = CupertinoIcons.smoke;}
      break;
    case "Shower rain": {temp = CupertinoIcons.cloud_rain;}
      break;
    case "Rain": {temp = CupertinoIcons.cloud_sun_rain;}
      break;
    case "Thunderstorm": {temp = CupertinoIcons.cloud_bolt;}
      break;
    case "Snow": {temp = CupertinoIcons.snow;}
      break;
    case "Mist": {temp = CupertinoIcons.cloud_fog;}
      break;
      
  }

  return temp;
}