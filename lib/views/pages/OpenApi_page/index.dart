import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:myApp/views/pages/OpenApi_page/list_view_item.dart';
import 'package:myApp/views/pages/OpenApi_page/list_refresh.dart';
import 'package:myApp/views/pages/OpenApi_page/open_page_item.dart';
import 'package:myApp/views/pages/main_left_page.dart';
import 'package:myApp/utils/index.dart';

class OpenScreen extends StatefulWidget {
  @override
  createState() => new _OpenScreenState();
}

class _OpenScreenState extends State with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController =
        // TabController(vsync: this, length: 6); // 和下面的 TabBar.tabs 数量对应
        TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: new AppBar(
            // title: new Text('首页'),
            key: _scaffoldKey,
            // leading: new Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage("assets/nothing.png"),
            //     ),
            //   ),
            // ),
            centerTitle: true,
            title: TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.all(12.0),
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: () {})
            ],
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            FirstPage(),
            Text('历史页面'),
            Text('图片页面'),
          ]),
          drawer: new Drawer(
            child: new MainLeftPage(),
          )),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // Future<bool> _unKnow;
  // GlobalKey<DisclaimerMsgState> key;

  @override
  bool get wantKeepAlive => true;

  // @override
  // void initState() {
  //   super.initState();
  //   if (key == null) {
  //     key = GlobalKey<DisclaimerMsgState>();
  //     // key = const Key('__RIKEY1__');
  //     //获取sharePre
  //     _unKnow = _prefs.then((SharedPreferences prefs) {
  //       return (prefs.getBool('disclaimer::Boolean') ?? false);
  //     });

  //     /// 判断是否需要弹出免责声明,已经勾选过不在显示,就不会主动弹
  //     _unKnow.then((bool value) {
  //       new Future.delayed(const Duration(seconds: 1), () {
  //         if (!value) {
  //           key.currentState.showAlertDialog(context);
  //         }
  //       });
  //     });
  //   }
  // }

  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    const juejin_flutter =
        'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param = {'page': pageIndex, 'pageSize': 20, 'sort': 'rankIndex'};
    var responseList = [];
    var pageTotal = 0;

    try {
      var response = await NetUtils.get(juejin_flutter, params: _param);
      responseList = response['d']['entrylist'];
      pageTotal = response['d']['total'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
    } catch (e) {}
    pageIndex += 1;
    List resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        FirstPageItem cellData = new FirstPageItem.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {
      "list": resultList,
      'total': pageTotal,
      'pageIndex': pageIndex
    };
    return result;
  }

  Widget makeCard(index, item) {
    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';
    return new ListViewItem(
      itemUrl: codeUrl,
      itemTitle: myTitle,
      data: myUsername,
    );
  }

  // headerView() {
  //   return Column(
  //     children: <Widget>[
  //       Stack(
  //           //alignment: const FractionalOffset(0.9, 0.1),//方法一
  //           children: <Widget>[
  //             Pagination(),
  //             Positioned(
  //                 //方法二
  //                 top: 10.0,
  //                 left: 0.0,
  //                 child: DisclaimerMsg(key: key, pWidget: this)),
  //           ]),
  //       SizedBox(
  //           height: 1, child: Container(color: Theme.of(context).primaryColor)),
  //       SizedBox(height: 10),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Column(children: <Widget>[
//          new Stack(
//            //alignment: const FractionalOffset(0.9, 0.1),//方法一
//            children: <Widget>[
//            Pagination(),
//            Positioned(//方法二
//              top: 10.0,
//              left: 0.0,
//              child: DisclaimerMsg(key:key,pWidget:this)
//            ),
//          ]),
//          SizedBox(height: 2, child:Container(color: Theme.of(context).primaryColor)),
      new Expanded(
          //child: new List(),
          child: ListRefresh(getIndexListData, makeCard))
    ]);
  }
}
