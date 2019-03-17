import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: SafeArea(
        child: Scrollbar(
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        width: mwidth,
                        // height: mheight,
                        color: Colors.white,
                        child: Wrap(
                          children: list,
                          spacing: 5, // 主轴(水平)方向间距
                          runSpacing: 5, // 纵轴（垂直）方向间距
                          crossAxisAlignment: WrapCrossAlignment.center,
                        ),
                      ),
                    )))),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 5000) {
          setState(() {
            list.insert(list.length - 1, buildPhoto(list.length - 1));
          });
        }
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.black54,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add),
            Text("照片",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        )),
        // child: Icon(Icons.add),
      ),
    );
  }

  Widget buildPhoto(int i) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 3,
      height: (MediaQuery.of(context).size.width - 30) / 3,
      color: Colors.grey,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            color: Colors.blue,
            size: 50,
          ),
          Text("照片$i",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      )),
    );
  }
}
