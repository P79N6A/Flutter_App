//执行程序入口
void main() {
  int i = 7;
  double d = 10.1;

  print(i / d); //0.6930693069306931
  print(i ~/ d); //0   这个操作是取整 就是得出商

  print(i.isOdd); // 判断是奇数
  print(i.isEven); // 判断是偶数

  //String -> int
  var x1 = int.parse("7");
  print(x1 == 7); //输出true

  //Sting -> double
  var x2 = double.parse("7.7");
  print(x2 == 7.7); //输出true

  //int -> String
  var x3 = 7.toString();
  print(x3 == '7'); //输出true

  //double -> String
  var x4 = 7.1234.toStringAsFixed(2);
  print(x4 == '7.12'); //输出true

  //求绝对值
  var x5 = (-7).abs();
  print(x5 == 7);

  //四舍五入1
  var x6 = (7.7).round();
  print(x6); //输出8

  //四舍五入2
  var x7 = (7.3).round();
  print(x7); //输出7

  //求大小于它的最大整数
  var x8 = (7.7).floor();
  print(x8); //输出7

  //求大于它的最小整数
  var x9 = (7.7).ceil();
  print(x9); //输出8

  double num1 = 7.77;
  print(num1); //结果是7.77
  double num2 = 7;
  print(num2); //结果是7.0
  int num3 = 7;
  print(num3.toDouble()); //int 转 double 结果是7.0
  double num4 = 7.77;
  print(num4.toInt()); //double 转 int 结果是7
}
