import 'package:flutter/material.dart';

class ListViewDome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GridViewState();
}

class GridViewState extends State {
  static List tabData = [
    {'text': '业界动态', 'icon': new Icon(Icons.language)},
    {'text': 'WIDGET', 'icon': new Icon(Icons.extension)},
    {'text': '组件收藏', 'icon': new Icon(Icons.favorite)},
    {'text': '关于手册', 'icon': new Icon(Icons.import_contacts)}
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView'),
        ),
        body: new GridView.count(
            primary: false,
            padding: const EdgeInsets.all(8.0),
            mainAxisSpacing: 8.0, //竖向间距
            crossAxisCount: 2, //横向Item的个数
            crossAxisSpacing: 8.0, //横向间距
            children: buildGridTileList(5)));
  }

  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < number; i++) {
      widgetList.add(getItemWidget(i, tabData));
    }

    return widgetList;
  }

  String url =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
      "3408544765&fm=27&gp=0.jpg";
  Widget getItemWidget(i, tabData) {
    //BoxFit 可设置展示图片时 的填充方式
    return new Container(
        child: new Column(children: <Widget>[
      Text("no.$i",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
      Image(image: new NetworkImage(url), fit: BoxFit.cover),
    ]));
  }
}
