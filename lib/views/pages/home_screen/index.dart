import 'package:flutter/material.dart';
import 'package:myApp/views/pages/home_screen/ListView/builder.dart';
import 'package:myApp/views/pages/home_screen/ListView/list.dart';
import 'package:myApp/views/pages/home_screen/ListView/warp_demo.dart';
import 'package:myApp/views/pages/home_screen/Button/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('组件'),
      ),
      body: GridHomePage(),
    );
  }
}

class GridHomePage extends StatefulWidget {
  _GridHomePage createState() => _GridHomePage();
}

class _GridHomePage extends State<GridHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blueGrey[100],
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                padding: const EdgeInsets.all(5.0),
                // border: new Border.all(width: 10.0, color: Colors.black38),
                childAspectRatio: 1.3,
                children: <Widget>[
                  Card(
                      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
                      // color: Colors.green, //  卡片背景颜色
                      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
                      // margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            //导航到新路由
                            // Navigator.pushNamed(context, "page_Text");
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) {
                              return new ListViewbuilder();
                            }));
                          },
                          color: Colors.white, //按钮背景颜色
                          highlightColor: Colors.grey, //按钮按下时的背景颜色
                          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
                          splashColor: Colors.blue, //点击时，水波动画中水波的颜色
                          elevation: 2.0, //正常状态下的阴影
                          highlightElevation: 8.0, //按下时的阴影
                          disabledElevation: 0.0, // 禁用时的阴影
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.free_breakfast,
                                color: Colors.blue,
                                size: 50,
                              ),
                              Text("ListView",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.deepPurple)),
                            ],
                          ))),
                  Card(
                      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
                      // color: Colors.green, //  卡片背景颜色
                      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
                      // margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            //导航到新路由
                            // Navigator.pushNamed(context, "page_Text");
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) {
                              return new ListViewDome();
                            }));
                          },
                          color: Colors.white, //按钮背景颜色
                          highlightColor: Colors.grey, //按钮按下时的背景颜色
                          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
                          splashColor: Colors.blue, //点击时，水波动画中水波的颜色
                          elevation: 2.0, //正常状态下的阴影
                          highlightElevation: 8.0, //按下时的阴影
                          disabledElevation: 0.0, // 禁用时的阴影
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.free_breakfast,
                                color: Colors.blue,
                                size: 50,
                              ),
                              Text("ListView2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.deepPurple)),
                            ],
                          ))),
                  Card(
                      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
                      // color: Colors.green, //  卡片背景颜色
                      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
                      // margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            //导航到新路由
                            // Navigator.pushNamed(context, "page_Text");
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) {
                              return new PageButton();
                            }));
                          },
                          color: Colors.white, //按钮背景颜色
                          highlightColor: Colors.grey, //按钮按下时的背景颜色
                          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
                          splashColor: Colors.blue, //点击时，水波动画中水波的颜色
                          elevation: 2.0, //正常状态下的阴影
                          highlightElevation: 8.0, //按下时的阴影
                          disabledElevation: 0.0, // 禁用时的阴影
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.radio_button_checked,
                                color: Colors.green,
                                size: 50,
                              ),
                              Text("Button",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.deepPurple)),
                            ],
                          ))),
                  Card(
                      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
                      // color: Colors.green, //  卡片背景颜色
                      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
                      // margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            //导航到新路由
                            // Navigator.pushNamed(context, "page_Text");
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) {
                              return new WarpDemo();
                            }));
                          },
                          color: Colors.white, //按钮背景颜色
                          highlightColor: Colors.grey, //按钮按下时的背景颜色
                          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
                          splashColor: Colors.blue, //点击时，水波动画中水波的颜色
                          elevation: 2.0, //正常状态下的阴影
                          highlightElevation: 8.0, //按下时的阴影
                          disabledElevation: 0.0, // 禁用时的阴影
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.airport_shuttle,
                                color: Colors.yellow,
                                size: 50,
                              ),
                              Text("GridView",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.deepPurple)),
                            ],
                          ))),
                  GridTile(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Icon(
                        Icons.airport_shuttle,
                        color: Colors.green,
                        size: 50,
                      ),
                    ),
                    footer: Text("2",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  GridTile(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Icon(
                        Icons.all_inclusive,
                        color: Colors.blue,
                        size: 50,
                      ),
                    ),
                    footer: Text("3",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  GridTile(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Icon(
                        Icons.beach_access,
                        color: Colors.yellow,
                        size: 50,
                      ),
                    ),
                    footer: Text("4",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  GridTile(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Icon(
                        Icons.cake,
                        color: Colors.brown,
                        size: 50,
                      ),
                    ),
                    footer: Text("5",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  GridTile(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Icon(
                        Icons.free_breakfast,
                        color: Colors.purple,
                        size: 50,
                      ),
                    ),
                    footer: Text("6",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Card(
                    child: GridTile(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Icon(
                          Icons.theaters,
                          color: Colors.purple,
                          size: 40,
                        ),
                      ),
                      footer: Text("7",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                    ),
                  ),
                  Card(
                    child: GridTile(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Icon(
                          Icons.free_breakfast,
                          color: Colors.purple,
                          size: 40,
                        ),
                      ),
                      footer: Text("8",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                    ),
                  ),
                  Card(
                      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
                      color: Colors.green, //  卡片背景颜色
                      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
                      // margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        onPressed: () => {},
                        color: Colors.white, //按钮背景颜色
                        highlightColor: Colors.blue[700], //按钮按下时的背景颜色
                        colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
                        splashColor: Colors.grey, //点击时，水波动画中水波的颜色
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20.0)), //外形
                        elevation: 2.0, //正常状态下的阴影
                        highlightElevation: 8.0, //按下时的阴影
                        disabledElevation: 0.0, // 禁用时的阴影
                        child: GridTile(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Icon(
                              Icons.free_breakfast,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                          footer: Text("9",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                        ),
                      ))
                ])));
  }
}
