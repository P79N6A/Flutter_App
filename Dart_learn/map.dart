void main() {
  Map map1 = new Map();
  //添加值 赋值
  map1["one"] = 'Android';
  map1["two"] = 'IOS';
  map1["three"] = 'Flutter';
  print(map1);
  Map map2 = Map.of(map1);
  print(map2);
  map2['four'] = "RN";
  print(map2);
  Map map3 = Map.fromEntries(map1.entries);
  print(map3);

  Map map5 = Map.identity();
  print(map5);
  Map map6 = {};
  print(map6);

  List<int> keys = [1, 2];
  List<String> values = ['Android', 'IOS'];
  Map map9 = Map.fromIterables(keys, values);
  print(map9);
  var map11 = new Map<int, String>();

  //对Map第一个位置赋值，中括号是key
  map11[0] = 'Android';
  //对Map第二个位置赋值
  map11[1] = 'IOS';
  //对Map第三个值赋值
  map11[2] = 'flutter';
  //对Map赋空值
  map11[3] = null;
  //因为Map中的键值是唯一的，当第二次输入的key如果存在，Value会覆盖之前
  map11[2] = 'RN';
  print(map11);

  //获取Map的长度
  print(map11.length); //输出：4

  //判断Map是否为空
  print(map11.isNotEmpty); //输出结果：true

  //判断Map是否不为空
  print(map11.isEmpty); //输出结果：false

  //检索Map是否含有某个Key
  print(map11.containsKey(1)); //输出：true

  //检索Map是否包含某个Value
  print(map11.containsValue('Android')); //输出：true

  // map11.forEach((key, value) {
  //   print("key:${key}, value:${value}");
  // });
}
