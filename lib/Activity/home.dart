import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/Getdata/work.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    //print("This is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    //print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroy");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      "Mumbai",
      "Delhi",
      "Banglore",
      "London",
      "Paris",
      "America"
    ];

    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['temp_value']).toString());
    if (temp == "NA") {
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 5);
    }
    String icon = info['icon_value'];
    String cityname = info['city_value'];
    String hum = info['hum_value'];
    String air = ((info['air_speed_value']).toString());
    if (air == "NA") {}
    else{
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String des = info['des_value'];
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          //backgroundColor: Colors.blue,
        ),
      ),*/
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade900, Colors.blue.shade200])),
          child: Column(
            children: [
              Container(
                //Search Container
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((search.text).replaceAll(" ", " ") == "") {
                        } else {
                          Navigator.pushReplacementNamed(context, "/loading", arguments: {
                            "searchText": search.text,
                          });
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          if ((value).replaceAll(" ", " ") == "") {
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": search.text,
                                });
                          }
                        },
                        controller: search,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search $city"),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          //IMAGE NETWORK
                          Image.network(
                              "http://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "$des",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "In $cityname",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  //TEMPERATURE CSS
                  Expanded(
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //TEMPERATURE VALUE
                              Text(
                                "$temp",
                                style: TextStyle(fontSize: 80),
                              ),
                              Text(
                                "c",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //WIND CSS CODE
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(30),
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.cloudy_windy),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("km/hr")
                        ],
                      ),
                    ),
                  ),

                  //HUMIDITY CSS CODE
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(30),
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("Percent")
                        ],
                      ),
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
