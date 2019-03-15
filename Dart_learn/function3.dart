import 'dart:math';

// export 'src/DartProject_base.dart';

// TODO: Export any libraries intended for clients of this package.

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

main() {
  var p = new Point(3, 4);
  print(p.distanceFromOrigin); //输出：3.605551275463989
  print(p.x); //输出：3.605551275463989
  print(p.y); //输出：3.605551275463989
  print(p); //输出：3.605551275463989
}
