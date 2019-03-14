import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myApp/views/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myApp/blocs/index.dart';
import 'package:myApp/common/component_index.dart';
import 'package:myApp/data/net/dio_util.dart';
// import 'package:myApp/views/widgets/bottom_navigationbar/bottom_navigation_widget.dart';
import 'package:myApp/views/widgets/bottom_navigationbar/navigation_keep_alive.dart';

void main() => runApp(BlocProvider<ApplicationBloc>(
      //runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，在本示例中它是MyApp类的一个实例，该参数代表Flutter应用。
      bloc: ApplicationBloc(),
      child: BlocProvider(child: MyApp(), bloc: MainBloc()),
    ));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale _locale;

  @override
  void initState() {
    super.initState();
    setLocalizedValues(localizedValues);
    _init();
    _initAsync();
    _initListener();
  }

  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.server_address;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      switch (value.id) {
        case EventIds.home:
          _loadLocale();
          break;
        default:
          break;
      }
    });
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model = SpHelper.getLanguageModel();
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }
    });
  }

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
        primaryIconTheme: new IconThemeData(color: Colours.gray_33),
        accentIconTheme: new IconThemeData(color: Colors.red),
        //indicatorColor: Colors.white,
      ),
      //应用首页路由
      routes: {
        '/MainPage': (ctx) => NavigationKeepAlive(),
      },
      home: new SplashPage(),

      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}

// import 'package:flutter/material.dart'; //导入包
// import 'package:myApp/views/widgets/bottom_navigationbar/bottom_navigation_widget.dart';
// import 'package:myApp/views/widgets/bottom_navigationbar/navigation_keep_alive.dart';
// import 'package:myApp/views/pages/splash_page.dart';

// void main() => runApp(
//     new MyApp()); //runApp 方法，它的功能是启动Flutter应用，它接受一个Widget参数，在本示例中它是MyApp类的一个实例，该参数代表Flutter应用。

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       //应用的名称
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         //蓝色主题
//         primarySwatch: Colors.blueGrey,
//       ),
//       //应用首页路由
//       // home: BottomNavigationWidget(),
//       // home: NavigationKeepAlive(),
//       routes: {
//         '/MainPage': (ctx) => NavigationKeepAlive(),
//       },
//       home: new SplashPage(),
//       // home: new App(),
//     );
//   }
// }
