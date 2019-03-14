import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomeScreen extends StatefulWidget {
  @override
  createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
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
