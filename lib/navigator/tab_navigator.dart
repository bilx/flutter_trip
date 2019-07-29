import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/mine_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';
import 'package:flutter/cupertino.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabNavigator> {
  //当前选中的page索引
  var _currIndex = 0;
  var _pageController = PageController();

  var _defColor = Colors.grey;
  var _selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.blue),
      home: Scaffold(
        body: PageView(
            controller: _pageController,
            children: <Widget>[
              HomePage(),
              SearchPage(),
              TravelPage(),
              MinePage()
            ],
            onPageChanged: (position) {
              setState(() {
                _currIndex = position;
              });
            }),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currIndex,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                curve: Curves.easeOutQuart,
                duration: Duration(milliseconds: 500),
              );
              setState(() {
                _currIndex = index;
              });
            },
            items: [
              //首页item
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _defColor,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: _selectedColor,
                  ),
                  title: Text(
                    "首页",
                    style: TextStyle(
                        color: _currIndex == 0 ? _selectedColor : _defColor),
                  )),
              //搜索item
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: _defColor,
                  ),
                  activeIcon: Icon(
                    Icons.search,
                    color: _selectedColor,
                  ),
                  title: Text(
                    "搜索",
                    style: TextStyle(
                        color: _currIndex == 1 ? _selectedColor : _defColor),
                  )),
              //旅拍item
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    color: _defColor,
                  ),
                  activeIcon: Icon(
                    Icons.camera_alt,
                    color: _selectedColor,
                  ),
                  title: Text(
                    "旅拍",
                    style: TextStyle(
                        color: _currIndex == 2 ? _selectedColor : _defColor),
                  )),
              //我的item
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: _defColor,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: _selectedColor,
                  ),
                  title: Text(
                    "我的",
                    style: TextStyle(
                        color: _currIndex == 3 ? _selectedColor : _defColor),
                  )),
            ]),
      ),
    );
  }
}
