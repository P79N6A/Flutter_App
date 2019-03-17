import 'package:flutter/material.dart'; //导入包
import 'package:english_words/english_words.dart';

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
      //注册路由表
      routes: {
        "page_Text": (context) => TextRoute(),
        "page_Button": (context) => PageButtonRoute(),
        "page_Icon": (context) => IconRoute(),
        "page_ScrollView": (context) => SingleChildScrollViewTestRoute(),
        "ListViewbuilder": (context) => ListViewbuilder(),
        "ListViewSeparated": (context) => ListViewSeparated(),
        "InfiniteGridView": (context) => InfiniteGridView(),
        "GridTileDemo": (context) => GridTileDemo(),
        "SliverGridDemo": (context) => SliverGridDemo(),
        "SliverGridDemo2": (context) => SliverGridDemo2(),
        "TabBarDemo": (context) => TabBarDemo(),
      },
      //应用首页路由
      home: new MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  ScrollController _scrollViewController;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

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

  @override
  Widget build(BuildContext context) {
    //Scaffold 是 Material库中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          // tabs: <Widget>[
          //    Tab(text: "Tabs 1"),
          //    Tab(text: "Tabs 2"),
          //    Tab(text: "Tabs 3"),
          //    Tab(text: "Tabs 4"),
          //    Tab(text: "Tabs 5"),
          //    Tab(text: "Tabs 6"),
          // ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        new Container(
          color: Colors.blueGrey,
          child: new Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RandomWordsWidget(),
              FlatButton(
                child: Text("$_counter"),
                textColor: Colors.blue,
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "page_Text");

                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (context) {
                  //   return new NewRoute();
                  // }));
                },
              ),
              FlatButton(
                child: Text("Button"),
                textColor: Colors.blue,
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "page_Button");
                },
              ),
              FlatButton(
                child: Text("Icon"),
                textColor: Colors.blue,
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "page_Icon");
                },
              ),
              FlatButton(
                child: Text("page_ScrollView"),
                textColor: Colors.blue,
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "page_ScrollView");
                },
              ),
              FlatButton(
                child: Text("ListViewbuilder"),
                textColor: Colors.blue,
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "ListViewbuilder");
                },
              ),
              FlatButton(
                child: Text("ListViewSeparated"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "ListViewSeparated");
                },
              ),
              FlatButton(
                child: Text("GridView"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "InfiniteGridView");
                },
              ),
              FlatButton(
                child: Text("GridTileDemo"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "GridTileDemo");
                },
              ),
              FlatButton(
                child: Text("SliverGridDemo"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "SliverGridDemo");
                },
              ),
              FlatButton(
                child: Text("SliverGridDemo2"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "SliverGridDemo2");
                },
              ),
              FlatButton(
                child: Text("TabBarDemo"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "TabBarDemo");
                },
              ),
            ],
          ),
        ),
        Text('历史页面'),
        Text('图片页面'),
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    print(wordPair.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class TextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      // body: Center(
      //   child: Text("这是个新的页面"),
      // ),

      body: new Container(
          child: new Column(children: <Widget>[
        DefaultTextStyle(
          //1.设置文本默认样式
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("hello world"),
              Text("I am Jack"),
              Text(
                "I am Jack",
                style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(
          "Hello world",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed),
          textAlign: TextAlign.center,
        ),
        Text(
          "Hello world! I'm Jack. " * 4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Hello world",
          textScaleFactor: 1.5,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Home: "),
          TextSpan(
            text: "https://flutterchina.club",
            style: TextStyle(color: Colors.blue),
            // recognizer: _tapRecognizer
          ),
        ]))
      ])),
    );
  }
}

class PageButtonRoute extends StatelessWidget {
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

class IconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片和Icon"),
        ),
        body: new Container(
          // child: Scrollbar(
          child: SingleChildScrollView(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image(image: AssetImage("assets/nothing.png"), width: 100.0),
                Image.asset(
                  "assets/nothing.png",
                  width: 100.0,
                ),
                Image(
                  image: NetworkImage(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                  width: 100.0,
                ),
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                ),
                Image(
                  image: AssetImage("assets/avatar.png"),
                  width: 100.0,
                  color: Colors.blue, //图片的混合色值
                  colorBlendMode: BlendMode.difference, //混合模式
                ),
                Image(
                    image: AssetImage("assets/avatar.png"),
                    width: 100.0,
                    height: 200.0,
                    repeat: ImageRepeat.repeatY),
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ])),
        ));
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "111ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+:";
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动窗口"),
      ),
      // body: new Container(
      body: new Scrollbar(
        //如果要给可滚动widget添加滚动条，只需将Scrollbar作为可滚动widget的父widget即可
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          scrollDirection: Axis.vertical, //滚动方向:{垂直(默认):vertical,水平:horizontal}
          child: Center(
              child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          )),
        ),
      ),
    );
  }
}

//listview.builder
class ListViewbuilder extends StatefulWidget {
  @override
  createState() => new ListViewbuilderState();
}

class ListViewbuilderState extends State<ListViewbuilder> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView.builder'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 40, // item 的个数
        // itemExtent: 50.0, // 如果为非null，则强制子项在滚动方向上具有给定范围
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // final index = i;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index], index);
        });
  }

  Widget _buildRow(WordPair pair, index) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ), //item标题
      leading: Icon(Icons.keyboard), //item 前置图标
      subtitle: Text("subtitle $index"), // item 副标题
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), //item后置图标
      isThreeLine: false, //是否三行显示
      dense: true, // item 直观感受是整体大小
      contentPadding: EdgeInsets.all(2.0), // item 内容内边距
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }, //item 点击事件
      onLongPress: () {
        print('长按:$index');
      }, //长按事件
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

//ListView.Separated
class ListViewSeparated extends StatefulWidget {
  @override
  createState() => new ListViewSeparatedState();
}

class ListViewSeparatedState extends State<ListViewSeparated> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView.separated'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 100, // item 的个数
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1.0, color: Colors.blue),
        itemBuilder: (context, i) {
          // final index = i;
          // 如果是建议列表中最后一个单词对
          if (i >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[i], i);
        });
  }

  Widget _buildRow(WordPair pair, index) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ), //item标题
      leading: Icon(Icons.phone), //item 前置图标
      subtitle: Text(
          "phone: $index$index$index$index$index$index$index$index$index$index$index$index"), // item 副标题
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), //item后置图标
      isThreeLine: false, //是否三行显示
      dense: true, // item 直观感受是整体大小
      contentPadding: EdgeInsets.all(2.0), // item 内容内边距
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }, //item 点击事件
      onLongPress: () {
        print('长按:$index');
      }, //长按事件
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存Icon数据

  // @override
  // void initState() {
  //   // 初始化数据
  //   _retrieveIcons();
  // }

  @override
  Widget build(BuildContext context) {
    void _onPressed(IconData icon) {
      print('点击:$icon');
    }

    _retrieveIcons(); // 初始化数据

    return new Scaffold(
        appBar: new AppBar(title: new Text('ListView.builder')),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //每行三列
                childAspectRatio: 1.0 //显示区域宽高相等
                ),
            itemCount: _icons.length,
            itemBuilder: (context, index) {
              //如果显示到最后一个并且Icon总数小于200时继续获取数据
              if (index == _icons.length - 1 && _icons.length < 200) {
                _retrieveIcons();
              }
              return IconButton(
                  icon: new Icon(_icons[index]),
                  onPressed: () => _onPressed(_icons[index]));
            }));
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 1)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

class GridTileDemo extends StatefulWidget {
  _GridTileDemo createState() => _GridTileDemo();
}

class _GridTileDemo extends State<GridTileDemo> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridTile"),
        ),
        body: Container(
            // height: 400,
            color: Color(0xffc91b3a),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
              childAspectRatio: 1.3,
              children: <Widget>[
                GridTile(
                  header: GridTileBar(
                    title: Text('title'),
                    subtitle: Text('subtitle'),
                    leading: Icon(Icons.add),
                    trailing: Text("trailing"),
                  ),
                  child: Container(),
                ),
                GridPaper(
                  color: Colors.red,
                  child: Image.network(
                      'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                      scale: 1,
                      fit: BoxFit.cover),
                ),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                GridTile(
                  header: Text("标题", style: TextStyle(color: Colors.white)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text("内容", style: TextStyle(color: Colors.white)),
                  ),
                  footer: Text("底部", style: TextStyle(color: Colors.white)),
                ),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                GridTile(
                  header: Text("标题", style: TextStyle(color: Colors.white)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () => {},
                    ),
                  ),
                  footer: Text("底部", style: TextStyle(color: Colors.white)),
                ),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
                Image.network(
                    'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                    scale: 1,
                    fit: BoxFit.cover),
              ],
            )));
  }
}

class SliverGridDemo extends StatefulWidget {
  _SliverGridDemo createState() => _SliverGridDemo();
}

class _SliverGridDemo extends State<SliverGridDemo> {
  Widget showCustomScrollView() {
    return Scaffold(
        appBar: AppBar(title: Text("SliverGridDemo")),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 5)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 40,
              ),
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Container(color: Color(0xffc91b3a), child: showCustomScrollView());
  }
}

// class SliverGridDemo2 extends StatefulWidget {
//   _SliverGridDemo2 createState() => _SliverGridDemo2();
// }

// class _SliverGridDemo2 extends State<SliverGridDemo2> {
class SliverGridDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "assets/nothing.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo() : super();

  @override
  State<StatefulWidget> createState() => _TabBarDemo();
}

// AppBar 默认的实例,有状态
class _TabBarDemo extends State with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController =
        TabController(vsync: this, length: 6); // 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。
    // 否则，如果最近的 Navigator 具有任何先前的 router ，则会插入BackButton。
    // 这种行为可以通过设置来关闭automaticallyImplyLeading 为false。在这种情况下，空的 leading widget 将导致 middle/title widget ������开始。
    return SizedBox(
        height: 500,
        child: Scaffold(
          appBar: AppBar(
            // 大量配置属性参考 SliverAppBar 示例
            title: Text('TabBar'),
            // leading: Icon(Icons.home),
            // backgroundColor: Colors.amber[1000],
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: "Tabs 1"),
                Tab(text: "Tabs 2"),
                Tab(text: "Tabs 3"),
                Tab(text: "Tabs 4"),
                Tab(text: "Tabs 5"),
                Tab(text: "Tabs 6"),
              ],
            ),
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            Text('TabsView 1'),
            Text('TabsView 2'),
            Text('TabsView 3'),
            Text('TabsView 4'),
            Text('TabsView 5'),
            Text('TabsView 6'),
          ]),
        ));
  }
}
