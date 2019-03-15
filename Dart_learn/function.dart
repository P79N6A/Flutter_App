void main(List<String> args) {
  List list = [0, null, 2, 3, 4];
  bool isNoble(int atomicNumber) {
    return list[atomicNumber] != null;
  }

  isNoble2(int num) => print(list[num] != null);

  isNoble(1);
  isNoble2(2);

  //定义一个方法 [String device]是可选位置参数 也就是调用这个方法可以不传这个参数
  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

//不使用可选参数调用方法
  print(say('Bob', 'Howdy'));

//使用可选参数调用方法
  print(say('Bob', 'Howdy', 'smoke signal'));
  enableFlags();
}

void enableFlags({bool bold = false, bool hidden = false}) {
  print(bold);
}
