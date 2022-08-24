import 'package:http/http.dart';
import 'dart:convert';

class worker {
  late String location;

  //Constructor
  worker(this.location) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  Future<void> getData() async {
    //Get Data
    try {
      Response response = await get(Uri.parse("[ENTER YOUR API HERE]"));
      Map data = jsonDecode(response.body);

      //Getting Temp And Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double gettemp = temp_data['temp'] - 273.15;

      //Getting Air Speed
      Map wind = data['wind'];
      double getair_speed = wind["speed"] / 0.27777777777778;

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getmain_des = weather_main_data['main'];
      String getdesc = weather_main_data["description"];

      //Assingning Value
      temp = gettemp.toString(); //Degree Celcius
      humidity = getHumidity; //Percentage
      air_speed = getair_speed.toString(); //KM/HR
      description = getdesc;
      main = getmain_des;
      icon = weather_main_data["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "City Not Found";
      main = "NA";
      icon = "09n";
    }
  }
}
