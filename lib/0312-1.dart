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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold 是 Material库中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
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
              child: Text("page_ListViewRote"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.pushNamed(context, "page_ScrollView");
              },
            ),
          ],
        ),
      ),
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

//listview
