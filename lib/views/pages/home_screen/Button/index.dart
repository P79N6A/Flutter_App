import 'package:flutter/material.dart'; //导入包

class PageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: new Container(
          child: new Column(children: <Widget>[
        FlatButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        OutlineButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
        RaisedButton(
          color: Colors.blue, //按钮背景颜色
          highlightColor: Colors.blue[700], //按钮按下时的背景颜色
          colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
          splashColor: Colors.red, //点击时，水波动画中水波的颜色
          child: Text("Submit"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //外形
          onPressed: () => {},
          elevation: 2.0, //正常状态下的阴影
          highlightElevation: 8.0, //按下时的阴影
          disabledElevation: 0.0, // 禁用时的阴影
        )
      ])),
    );
  }
}
