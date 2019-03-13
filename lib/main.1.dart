import 'package:flutter/material.dart'; //导入包
import 'package:myApp/views/widgets/bottom_navigationbar/bottom_navigation_widget.dart';
import 'package:myApp/views/widgets/bottom_navigationbar/navigation_keep_alive.dart';

void main() => runApp(
    new MyApp()); //runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，在本示例中它是MyApp类的一个实例，该参数代表Flutter应用。

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用的名称
      title: 'Flutter Demo',
      theme: new ThemeData(
        //蓝色主题
        primarySwatch: Colors.blueGrey,
      ),
      //应用首页路由
      // home: BottomNavigationWidget(),
      home: NavigationKeepAlive(),
    );
  }
}
