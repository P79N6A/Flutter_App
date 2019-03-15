//执行程序入口
void main() {
  var clapp = '\u{1f44f}';
  print(clapp); //输出：👏

  print(clapp.codeUnits); //输出： [55357, 56399]
  print(clapp.runes.toList()); //输出：  [128079]

  //使用String. fromCharCodes方法显示字符图形
  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input)); //输出：♥  😅  😎  👻  🖖  👍
}
