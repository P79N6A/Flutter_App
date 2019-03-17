import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
    return SafeArea(
        child: Container(
            color: Colors.grey[200],
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1000, // item 的个数
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
                })));
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
              body: SafeArea(
                  child: Container(
                color: Colors.grey[200],
                child: new ListView(children: divided),
              )));
        },
      ),
    );
  }
}
