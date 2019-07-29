import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MineState();
}

class _MineState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("我的"),
      ),
    );
  }
}
