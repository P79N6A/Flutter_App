import 'package:flutter/material.dart';
import 'package:myApp/views/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myApp/views/widgets/bottom_navigationbar/navigation_keep_alive.dart';

void main() => runApp(
    new MyApp()); //runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，在本示例中它是MyApp类的一个实例，该参数代表Flutter应用。

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用的名称
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        //蓝色主题
        primaryColor: Colors.blueGrey,
        //primaryColorLight: _themeColor,
        //iconTheme: new IconThemeData(color: Colors.green),
        // primaryIconTheme: new IconThemeData(color: Colors.deepPurple),
        // accentIconTheme: new IconThemeData(color: Colors.red),
        //indicatorColor: Colors.white,
      ),
      //应用首页路由
      routes: {
        '/MainPage': (ctx) => NavigationKeepAlive(),
      },
      home: new SplashPage(),
      // locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        // <-- 添加语言包
        const Locale('zh', 'CH'),
      ],
    );
  }
}
