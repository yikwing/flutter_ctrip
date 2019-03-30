import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/bottom_bar_model.dart';
import 'package:flutter_xiecheng/pages/home.dart';
import 'package:flutter_xiecheng/pages/me.dart';
import 'package:flutter_xiecheng/pages/search.dart';
import 'package:flutter_xiecheng/pages/travel.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<BottomBarModel> mbottom = List();
  List<BottomNavigationBarItem> mBottomNavigationBarItem = List();
  List<Widget> mWidget = List();

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);

    mbottom
      ..add(BottomBarModel('首页', Icon(Icons.home)))
      ..add(BottomBarModel('搜索', Icon(Icons.search)))
      ..add(BottomBarModel('旅拍', Icon(Icons.camera_alt)))
      ..add(BottomBarModel('我的', Icon(Icons.person_pin)));

    mBottomNavigationBarItem = mbottom
        .map((f) => BottomNavigationBarItem(icon: f.icon, title: Text(f.title)))
        .toList();

    mWidget
      ..add(HomePage())
      ..add(SearchPage())
      ..add(TravelPage())
      ..add(MePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: mWidget,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: mBottomNavigationBarItem,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
