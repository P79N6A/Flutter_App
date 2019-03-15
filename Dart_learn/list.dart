void main() {
  //创建一个int类型的list 并赋值为0，1，2，3，4
  List list = [0, 1, 2, 3, 4];

  //使用构建的方式创建list
  List list1 = new List();

  //创建一个常量的List，不可以改变的List
  List list2 = const [0, 1, 2, 3];

  //增加泛型
  List list3 = new List<String>();
  list3.add("222");
  list3.add("nniiid");

  //创建固定的长度的数组列表，不能移除或者增加
  List list4 = new List(5);
  list4[1] = 1;
  // list4.add(11);

  //创建包含所有以下元素的可改变的长度列表
  List list5 = new List.from([0, 1, 2, 3]);
  // list5.add(1);
  // list5.remove(1);
  list5.removeAt(0);

  //创建在固定范围内改变长度的列表
  List list6 = new List()..length = 10;
  list6[3] = 11;
  list6.remove(11);
  list6.add(11213);
  list6.add(12222);
  list6.add(12222);
  list6.add(12222);
  list6.add(12222);
  list6.add(12222);

  //创建包含所有元素的固定长度列表
  List list7 = new List<String>.unmodifiable(["0", "1", "2"]);
  // list7.add(5);
  // list7.remove(1);

  //用生成器给所有元素赋初始值
  List list8 = new List<int>.generate(5, (int i) {
    return i + i;
  });
  //排序
  List list9 = [3, 1, 2, 6, 7];
  // 根据语法提示： List.sort([(int, int) → int compare]) → void
  list9.sort((a, b) => b.compareTo(a));
  print(list9);
  print(list1);
  print(list2);
  print(list7);
  print(list);
  print(list8);
}
