import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  State<TravelPage> createState() => _TravelState();
}

class _TravelState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("旅拍"),
      ),
    );
  }
}
