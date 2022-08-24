import 'package:flutter/material.dart';

class loaction extends StatefulWidget {
  const loaction({Key? key}) : super(key: key);

  @override
  State<loaction> createState() => _loactionState();
}

class _loactionState extends State<loaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Location Activity"),
    );
  }
}
