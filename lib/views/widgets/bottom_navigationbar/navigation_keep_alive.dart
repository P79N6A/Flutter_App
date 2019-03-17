import 'package:flutter/material.dart';

import 'package:myApp/views/pages/airplay_screen.dart';
import 'package:myApp/views/pages/OpenApi_page/index.dart';
import 'package:myApp/views/pages/home_screen/index.dart';
import 'package:myApp/views/pages/pages_screen.dart';

class NavigationKeepAlive extends StatefulWidget {
  @override
  _NavigationKeepAliveState createState() => _NavigationKeepAliveState();
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          OpenScreen(),
          HomeScreen(),
          PagesScreen(),
          AirPlayScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
        iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
        currentIndex: _currentIndex, // 当前所高亮的按钮index
        fixedColor:
            Colors.deepPurple, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
        // onTap: (index) => _controller.animateToPage(index,
        //     duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.language), title: Text('业界动态')),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension), title: Text('组件')),
          BottomNavigationBarItem(icon: Icon(Icons.pages), title: Text('页面')),
          BottomNavigationBarItem(icon: Icon(Icons.airplay), title: Text('我的')),
        ],
      ),
    );
  }
}
