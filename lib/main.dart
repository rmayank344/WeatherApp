// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/loading.dart';
import 'package:weather/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => loading(),
      "/home": (context) => Home(),
      "/loading": (context) => loading(),
    },
  ));
}
