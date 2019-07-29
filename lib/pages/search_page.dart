import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("搜索"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("搜索"),
      ),
    );
  }
}
