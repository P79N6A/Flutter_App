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
        "new_page": (context) => NewRoute(),
        // "tip_widgets": (context) => EchoRoute("内容固定")
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
  int _num = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _num = 2 * _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold 是 Material库中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '已经点击屏幕的次数:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text(
              '$_num',
              style: Theme.of(context).textTheme.display1,
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text("打开新的页面"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.pushNamed(context, "new_page");

                // Navigator.push(context,
                //     new MaterialPageRoute(builder: (context) {
                //   return new NewRoute();
                // }));
              },
            ),
            FlatButton(
              child: Text("打开新的页面2,传递参数:222"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                // Navigator.pushNamed(context, "tip_widgets");
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new EchoRoute("传递参数是:222");
                }));
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

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面title"),
      ),
      body: Center(
        child: Text("这是个新的页面"),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute(this.tip);
  final String tip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo route"),
      ),
      body: Center(
        //回显tip内容
        child: Text(tip),
      ),
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
