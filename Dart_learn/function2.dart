//执行程序入口
void main(List<String> art) {
  //调用判断对应小标的值是否为空
  // print(isNoble(1));    //输出：true
  print(art);
  doStuff(); //输出：list:  [1, 2, 3]
  //输出：gifts: {first: paper, second: cotton, third: leather}
}

//List和Map都取了默认值
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');

  var list2 = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
  list2.forEach((value) {
    print(list2.indexOf(value).toString() + ': ' + value);
  });
}
