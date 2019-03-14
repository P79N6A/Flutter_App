import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myApp/views/widgets/swiper/swiper.dart';
import 'package:myApp/utils/index.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> _guideList = [
    Utils.getImgPath('guide1'),
    Utils.getImgPath('guide2'),
    Utils.getImgPath('guide3'),
    Utils.getImgPath('guide4'),
  ];
  List<String> _guideInfoList = [
    "在你需要的每个地方",
    "载你去往每个地方",
    "懂你，更懂你所行",
    "因为在意，所以用心",
  ];

  List<Widget> _bannerList = new List();

  int _status = 0;
  int _count = 3;
  int _time = 5; //广告倒计时时间

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  //保存界面的输入选择信息
  void saveInfo() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("isFirst", true);
  }

  void _initAsync() async {
    final SharedPreferences prefs = await _prefs;
    final isFirst = prefs.getBool("isFirst");
    print("缓存中获取的$isFirst");
    if (isFirst == null) {
      _initBanner();
    } else {
      _initSplash();
    }
  }

  void _initSplash() {
    _doCountDown();
  }

  void _doCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: _time * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 1;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            new Center(
              child: new Text(
                _guideInfoList[i],
                style: new TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: new InkWell(
                  onTap: () {
                    saveInfo();
                    _goMain();
                  },
                  child: new Container(
                    width: 185,
                    alignment: Alignment.center,
                    height: 48,
                    child: new Text(
                      '立即启程',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        color: Color(0X19FFFFFF),
                        border:
                            new Border.all(width: 0.33, color: Colors.white70)),
                  ),
                ),
              ),
            ),
          ],
        ));
      } else {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            new Center(
              child: new Text(
                _guideInfoList[i],
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            )
          ],
        ));
      }
    }
  }

  Widget _buildBanner() {
    return new Offstage(
      offstage: (_status == 0),
      child: ObjectUtil.isEmpty(_bannerList)
          ? new Container()
          : new Swiper(
              autoStart: false,
              circular: false,
              indicator: CircleSwiperIndicator(
                  radius: 2,
                  spacing: 4,
                  padding: EdgeInsets.only(bottom: 32.0),
                  itemColor: Colors.white,
                  itemActiveColor: Color(0xFFFC9153)),
              children: _bannerList),
    );
  }

  Widget _buildAdWidget() {
    return new Offstage(
      offstage: (_status == 1),
      child: new InkWell(
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Image(
                image: AssetImage("assets/logon.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
            Positioned(
              top: 100.0,
              child: Text(
                "这里应该是个广告!!!",
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSplash() {
    return new Offstage(
      offstage: (_status == 1),
      child: new Align(
        alignment: Alignment.bottomCenter,
        child: new Container(
          height: 90,
          color: Colors.white,
          child: new Stack(
            children: <Widget>[
              new Center(
                child: Image(
                    image: AssetImage("assets/didi_logo.png"), width: 100.0),
              ),
              _buildCountDown()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountDown() {
    return new Offstage(
      offstage: (_status == 1),
      child: new Align(
        alignment: Alignment.bottomRight,
        child: new InkWell(
          onTap: () {
            _goMain();
          },
          child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(25),
            child: new RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(children: <TextSpan>[
                new TextSpan(
                    style: new TextStyle(fontSize: 14, color: Colors.orange),
                    text: "$_count"),
                new TextSpan(
                  style: new TextStyle(fontSize: 12, color: Colors.black54),
                  text: " 跳过",
                )
              ]),
            ),
            height: 30,
            width: 60,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: new Border.all(width: 0.33, color: Color(0xffcccccc))),
          ),
        ),
      ),
    );
  }

  // Widget _buildCountDown() {
  //   return new Offstage(
  //     offstage: (_status == 1),
  //     child: new Align(
  //       alignment: Alignment.bottomRight,
  //       child: new InkWell(
  //         onTap: () {
  //           _goMain();
  //         },
  //         child: new Container(
  //           alignment: Alignment.center,
  //           margin: EdgeInsets.all(30),
  //           child: new RichText(
  //             textAlign: TextAlign.center,
  //             text: new TextSpan(children: <TextSpan>[
  //               new TextSpan(
  //                   style: new TextStyle(fontSize: 14, color: Colors.orange),
  //                   text: "$_count"),
  //               new TextSpan(
  //                   style:
  //                       new TextStyle(fontSize: 12, color: Colors.orange),
  //                   text: " 跳过")
  //             ]),
  //           ),
  //           height: 30,
  //           width: 60,
  //           decoration: new BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //               border: new Border.all(
  //                   width: 0.33, color: Color(0xffcccccc)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/MainPage');
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          _buildBanner(),
          _buildAdWidget(),
          _buildSplash(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null)
      _timerUtil.cancel(); //���得中dispose里面���timer cancel。
  }
}
