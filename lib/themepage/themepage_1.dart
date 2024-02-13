// ignore_for_file: sort_child_properties_last

import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:hint_app_7/startpage.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint1.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint2.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint3.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint4.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint5.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint6.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint7.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint8.dart';
import 'package:hint_app_7/theme1_hintpage/theme1_hint9.dart';
import 'package:percent_indicator/percent_indicator.dart';

bool isSliderTouched = false;

class DotInfo {
  DotInfo(this.offset, this.size, this.color);
  final Offset offset;
  final double size;
  final Color color;
}

class DrawingP with ChangeNotifier {
  //provider
  final lines = <List<DotInfo>>[];
  double _size = 3;
  double get size => _size;

  set changeSize(double size) {
    _size = size;
    notifyListeners();
  }

  Color _color = Colors.black;
  Color get color => _color;
  set changecolor(Color color) {
    _color = color;
    notifyListeners();
  }

  bool _earsemode = false;
  bool get erasemode => _earsemode;

  void changeEraseMode() {
    _earsemode = !_earsemode;
    notifyListeners();
  }

  void drawStart(Offset offset) {
    var oneline = <DotInfo>[];
    oneline.add(DotInfo(offset, size, color));
    lines.add(oneline);
    notifyListeners();
  }

  void drawing(Offset offset) {
    lines.last.add(DotInfo(offset, size, color));
    notifyListeners();
  }

  void erase(Offset offset) {
    final _eraseRound = 15;
    for (var oneLine in List<List<DotInfo>>.from(lines)) {
      for (var oneDot in oneLine) {
        if (sqrt(pow(offset.dx - oneDot.offset.dx, 2) + pow(offset.dy - oneDot.offset.dy, 2)) < _eraseRound) {
          lines.remove(oneLine);
          break;
        }
      }
    }
    notifyListeners();
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;
  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      Color? color;
      double? size;
      var l = <Offset>[];
      var p = Path();
      for (var oneDot in oneLine) {
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(
          p,
          Paint()
            ..color = color!
            ..strokeWidth = size!
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ThemeScreen1 extends StatefulWidget {
  final int PlayTime;
  ThemeScreen1({required this.PlayTime});

  @override
  State<ThemeScreen1> createState() => _ThemeScreen1State();
}

class _ThemeScreen1State extends State<ThemeScreen1> with SingleTickerProviderStateMixin {
  // 타이머
  late Timer _timer;
  int _currentMinutes = 0;
  int _currentSeconds = 0;

  // provider
  var p = DrawingP();

  // 중간 탭
  late TabController _tabController;
  final List<String> _tablabels = ['힌트', '진행률'];

  //textfeild 내용
  TextEditingController _hintText = TextEditingController();
  TextEditingController _percentText = TextEditingController();

  // 힌트 코드
  var _word = "";

  // 힌트 코드
  var _hintcode1 = "#01";
  var _hintcode2 = "#02";
  var _hintcode3 = "#03";
  var _hintcode4 = "#04";
  var _hintcode5 = "#05";
  var _hintcode6 = "#06";
  var _hintcode7 = "#07";
  var _hintcode8 = "#08";
  var _hintcode9 = "#09";
  var _homecode = "#0000";
  var _hintclear = "#0987";

  // 힌트 사용 시 하단에 해당 페이지로 이동하는 버튼 추가
  bool _ShowHintBtn1 = false;
  bool _ShowHintBtn2 = false;
  bool _ShowHintBtn3 = false;
  bool _ShowHintBtn4 = false;
  bool _ShowHintBtn5 = false;
  bool _ShowHintBtn6 = false;
  bool _ShowHintBtn7 = false;
  bool _ShowHintBtn8 = false;
  bool _ShowHintBtn9 = false;

  //퍼센트
  var _percentwords = "0";
  double _percent = 0;

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tablabels.length, vsync: this);
    _initializeTimer();
    myFocusNode = FocusNode();
  }

  void _initializeTimer() {
    _currentMinutes = widget.PlayTime;
    _currentSeconds = 0;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          if (_currentMinutes > 0) {
            _currentMinutes--;
            _currentSeconds = 59;
          } else {
            _timer.cancel();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    _hintText.dispose();
    _percentText.dispose();
    _timer.cancel();
  }

  bool isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // 하단 창 지우기

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: Center(
              child: Container(
                child: AppBar(
                    //centerTitle: true,
                    automaticallyImplyLeading: false, // 좌측 탭에 뒤로가기 버튼 삭제
                    backgroundColor: Color(red2),
                    flexibleSpace: Container(
                      margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Image.asset("images/logo.png"),
                    )),
              ),
            )),
        body: WillPopScope(
            // 뒤로 가기 금지
            onWillPop: () {
              return Future(() => false);
            },
            child: Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Expanded(
                            child: Container(
                              color: Color(red2),
                              child: Center(
                                child: Container(
                                  child: AutoSizeText(
                                    '${_currentMinutes.toString().padLeft(2, '0')} : ${_currentSeconds.toString().padLeft(2, '0')}',
                                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Center(
                            child: Container(
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Container(
                                          child: Row(
                                    children: [
                                      Flexible(
                                          child: Container(
                                            color: Colors.white,
                                            child: Container(
                                                child: Expanded(
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2, // 칸 개수
                                                      childAspectRatio: 1.5 // 가로세로 비율
                                                      ),
                                                  itemCount: 2,
                                                  itemBuilder: (context, index) {
                                                    if (index == 0) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          _tabController.animateTo(index);
                                                        },
                                                        child: Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(0, 5, 5, 20),
                                                            color: Color(red2),
                                                            child: Center(
                                                              child: Container(
                                                                child: AutoSizeText(
                                                                  "힌트",
                                                                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                                                  textAlign: TextAlign.center,
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    if (index == 1) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          _tabController.animateTo(index);
                                                        },
                                                        child: Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                                                            color: Color(red2),
                                                            child: Center(
                                                              child: Container(
                                                                child: AutoSizeText(
                                                                  "진행률",
                                                                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                                                                  textAlign: TextAlign.center,
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  }),
                                            )),
                                          ),
                                          flex: 2),
                                      Flexible(
                                          child: Container(
                                              color: Colors.white,
                                              child: Container(
                                                color: Color(red2),
                                                margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                                child: InkWell(
                                                  // 메모 버튼
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return _showPaint(p: p);
                                                        });
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      child: AutoSizeText(
                                                        "메모",
                                                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                                        textAlign: TextAlign.center,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          flex: 1)
                                    ],
                                  ))),
                                ],
                              ),
                            ),
                          )),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          child: Expanded(
                              child: TabBarView(
                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: const EdgeInsets.all(10),
                                      color: Color(red2),
                                      child: Column(
                                        children: [
                                          // Hint Text Container
                                          Flexible(
                                              child: Center(
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                  child: AutoSizeText(
                                                    "Hint",
                                                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              flex: 1),
                                          Flexible(
                                              child: Container(
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
                                                            child: Center(
                                                              child: Container(
                                                                  color: Colors.white,
                                                                  child: Center(
                                                                      child: Container(
                                                                    margin: EdgeInsets.only(left: 10, top: 15),
                                                                    child: TextField(
                                                                      controller: _hintText,
                                                                      //onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                                                                      decoration: InputDecoration(
                                                                        border: InputBorder.none,
                                                                        hintText: '입력',
                                                                      ),
                                                                      style: TextStyle(fontSize: 25),
                                                                      onChanged: (text) {
                                                                        setState(() {});
                                                                      },
                                                                    ),
                                                                  ))),
                                                            ),
                                                          ),
                                                          flex: 7),
                                                      Flexible(
                                                        child: Container(
                                                          margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                                                          decoration: BoxDecoration(color: Color(red1), borderRadius: BorderRadius.circular(20)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              FocusScope.of(context).unfocus();

                                                              // 힌트 코드 입력

                                                              // 1번 코드 입력
                                                              if (_hintText.text == _hintcode1) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn1 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage1()));
                                                                });
                                                              }

                                                              // 힌트 2번 코드
                                                              else if (_hintText.text == _hintcode2) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn2 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage2()));
                                                                });
                                                              }

                                                              // 힌트 3번 코드
                                                              else if (_hintText.text == _hintcode3) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn3 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage3()));
                                                                });
                                                              }

                                                              // 4번 코드
                                                              else if (_hintText.text == _hintcode4) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn4 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage4()));
                                                                });
                                                              }

                                                              // 5번 코드
                                                              else if (_hintText.text == _hintcode5) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn5 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage5()));
                                                                });
                                                              }

                                                              // 6번 코드
                                                              else if (_hintText.text == _hintcode6) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn6 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage6()));
                                                                });
                                                              }

                                                              // 7번 코드
                                                              else if (_hintText.text == _hintcode7) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn7 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage7()));
                                                                });
                                                              }

                                                              // 8번 코드
                                                              else if (_hintText.text == _hintcode8) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn8 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage8()));
                                                                });
                                                              }

                                                              // 9번 코드
                                                              else if (_hintText.text == _hintcode9) {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _ShowHintBtn9 = true;
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Theme1HintPage9()));
                                                                });
                                                              } else if (_hintText.text == _hintclear) {
                                                                setState(() {
                                                                  _ShowHintBtn1 = false;
                                                                  _ShowHintBtn2 = false;
                                                                  _ShowHintBtn3 = false;
                                                                  _ShowHintBtn4 = false;
                                                                  _ShowHintBtn5 = false;
                                                                  _ShowHintBtn6 = false;
                                                                  _ShowHintBtn7 = false;
                                                                  _ShowHintBtn8 = false;
                                                                  _ShowHintBtn9 = false;

                                                                  _hintText.text = ''; // 힌트 입력 칸 초기화

                                                                  _word = ''; // 힌트 보여주는 칸 초기화
                                                                });
                                                              }

                                                              // 힌트 입력 칸 빈칸으로 확인 누른 경우ㅇ
                                                              else if (_hintText.text == '') {
                                                                setState(() {
                                                                  _word = '';
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (context) => AlertDialog(
                                                                      title: const Text(''),
                                                                      content: Text(
                                                                        "암호를 입력해주세요!",
                                                                        style: TextStyle(fontSize: 20),
                                                                        textAlign: TextAlign.center,
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text('확인'))
                                                                      ],
                                                                    ),
                                                                  );
                                                                });
                                                              }

                                                              // 특정 코드 입력시 테마 선택 창으로 이동
                                                              else if (_hintText.text == _homecode) {
                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                                                                _timer.cancel();
                                                              } else {
                                                                setState(() {
                                                                  _hintText.text = '';
                                                                  _word = '';
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (context) => AlertDialog(
                                                                      title: const Text(''),
                                                                      content: Text(
                                                                        "옳바른 암호를 입력해주세요!",
                                                                        style: TextStyle(fontSize: 20),
                                                                        textAlign: TextAlign.center,
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text('확인'))
                                                                      ],
                                                                    ),
                                                                  );
                                                                });
                                                              }
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Center(
                                                                  child: Text(
                                                                    "확인",
                                                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        flex: 3,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              flex: 1),
                                          Flexible(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: AutoSizeText(
                                                "힌트 사용 목록",
                                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                              ),
                                            ),
                                            flex: 1,
                                          ),
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                                color: Colors.white,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Flexible(
                                                          child: Container(
                                                            color: Colors.white,
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.grey,
                                                                      margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                                                                      child: _ShowHintBtn1
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage1()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 1번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.blueGrey,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                      child: _ShowHintBtn2
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage2()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 2번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      color: Colors.white,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                                                      child: _ShowHintBtn3
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage3()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 3번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 1),
                                                      Flexible(
                                                          child: Container(
                                                            color: Colors.white,
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.grey,
                                                                      margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                                                                      child: _ShowHintBtn4
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage4()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 4번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      // color: Colors.blueGrey,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                      child: _ShowHintBtn5
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage5()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 5번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.white,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                                                      child: _ShowHintBtn6
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage6()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 6번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 1),
                                                      Flexible(
                                                          child: Container(
                                                            color: Colors.white,
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.grey,
                                                                      margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                                                                      child: _ShowHintBtn7
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage7()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 7번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.blueGrey,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                      child: _ShowHintBtn8
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage8()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 8번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                  Flexible(
                                                                    child: Container(
                                                                      //color: Colors.white,
                                                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                                                      child: _ShowHintBtn9
                                                                          ? InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(context,
                                                                                    MaterialPageRoute(builder: (context) => Theme1HintPage9()));
                                                                              },
                                                                              child: Expanded(
                                                                                  child: Container(
                                                                                      color: Color(red2),
                                                                                      child: Center(
                                                                                        child: Container(
                                                                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                          child: AutoSizeText(
                                                                                            "힌트 9번",
                                                                                            style:
                                                                                                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                        ),
                                                                                      ))))
                                                                          : Container(),
                                                                    ),
                                                                    flex: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 1)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              flex: 5)
                                        ],
                                      ),
                                    )),

                                    // 힌트 보여주는 Container
                                  ],
                                ),
                              ),

                              // 진행률 탭 전체 Container

                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                      color: Color(red2),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Center(
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                      width: 280,
                                                      height: 80,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Container(
                                                          color: Colors.white,
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                            child: TextField(
                                                              controller: _percentText,
                                                              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                                                              decoration: InputDecoration(
                                                                border: InputBorder.none,
                                                                hintText: '입력',
                                                              ),
                                                              style: TextStyle(fontSize: 23),
                                                              onChanged: (text) {
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  width: 100,
                                                  height: 60,
                                                  decoration: BoxDecoration(color: Color(red1), borderRadius: BorderRadius.circular(20)),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      FocusScope.of(context).unfocus();
                                                      if (_percentText.text == _hintcode1) {
                                                        setState(() {
                                                          _percent = 0.1;
                                                          _percentwords = '10';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode2) {
                                                        setState(() {
                                                          _percent = 0.2;
                                                          _percentwords = '20';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode3) {
                                                        setState(() {
                                                          _percent = 0.3;
                                                          _percentwords = '30';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode4) {
                                                        setState(() {
                                                          _percent = 0.4;
                                                          _percentwords = '40';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode5) {
                                                        setState(() {
                                                          _percent = 0.5;
                                                          _percentwords = '50';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode6) {
                                                        setState(() {
                                                          _percent = 0.6;
                                                          _percentwords = '60';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode7) {
                                                        setState(() {
                                                          _percent = 0.7;
                                                          _percentwords = '70';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode8) {
                                                        setState(() {
                                                          _percent = 0.8;
                                                          _percentwords = '80';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == _hintcode9) {
                                                        setState(() {
                                                          _percent = 0.9;
                                                          _percentwords = '90';
                                                          _percentText.text = '';
                                                        });
                                                      } else if (_percentText.text == "") {
                                                        setState(() {
                                                          _percent = 0;
                                                          _percentwords = "0";

                                                          showDialog(
                                                            context: context,
                                                            builder: (context) => AlertDialog(
                                                              title: const Text(''),
                                                              content: Text(
                                                                "암호를 입력해주세요!",
                                                                style: TextStyle(fontSize: 20),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: const Text('확인'))
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          _percentText.text = '';
                                                          _percent = 0;
                                                          _percentwords = "0";
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) => AlertDialog(
                                                              title: const Text(''),
                                                              content: Text(
                                                                "옳바른 암호를 입력해주세요!",
                                                                style: TextStyle(fontSize: 20),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: const Text('확인'))
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            "확인",
                                                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20, top: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "진행률",
                                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Center(
                                              child: Expanded(
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                              // color: Colors.white,
                                              child: Center(
                                                child: Container(
                                                    child: LinearPercentIndicator(
                                                  alignment: MainAxisAlignment.center,
                                                  width: 390, // 바 넓이
                                                  backgroundColor: Color(red3),
                                                  animation: true,
                                                  animationDuration: 1200, // 애니메이션 지속 시간
                                                  lineHeight: 40,
                                                  percent: _percent,
                                                  center: Text(
                                                    '$_percentwords%',
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  barRadius: Radius.circular(13),
                                                  progressColor: Color(red1),
                                                )),
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ))),
                      flex: 6,
                    )
                  ],
                ),
              ),
            )));
  }
}

class _showPaint extends StatefulWidget {
  final DrawingP p;

  _showPaint({required this.p});

  @override
  _showPaintState createState() => _showPaintState();
}

class _showPaintState extends State<_showPaint> {
// var p = DrawingP();
  bool isSliderTouched = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 400,
      height: 800,
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: DrawingPainter(widget.p.lines))),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (s) {
                  if (widget.p.erasemode) {
                    setState(() {
                      widget.p.erase(s.localPosition);
                    });
                  } else {
                    setState(() {
                      widget.p.drawStart(s.localPosition);
                    });
                  }
                },
                onPanUpdate: (s) {
                  if (widget.p.erasemode) {
                    setState(() {
                      widget.p.erase(s.localPosition);
                    });
                  } else {
                    setState(() {
                      widget.p.drawing(s.localPosition);
                    });
                  }
                },
                child: Container(),
              )
            ],
          )),
          Container(
            color: Colors.grey[800],
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Row(
                      children: [
                        _colorWidget(Colors.black),
                        _colorWidget(Colors.red),
                        _colorWidget(Colors.yellow),
                        _colorWidget(Colors.green),
                        _colorWidget(Colors.blue)
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        value: widget.p.size,
                        onChanged: (size) {
                          if (!isSliderTouched) {
                            setState(() {
                              widget.p.changeSize = size;
                            });
                          }
                        },
                        onChangeStart: (value) {
                          setState(() {
                            isSliderTouched = true;
                          });
                        },
                        onChangeEnd: (value) {
                          setState(() {
                            isSliderTouched = false;
                          });
                        },
                        min: 3,
                        max: 15,
                      ),
                    ))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              widget.p.changeEraseMode();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(50, 0, 0, 15),
                            width: 110,
                            height: 50,
                            child: Container(
                              child: Center(
                                child: Container(
                                  width: 110,
                                  height: 50,
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20), color: widget.p.erasemode ? Colors.yellow : Colors.white),
                                  child: Center(
                                    child: Text(
                                      '지우개',
                                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Container(
                              height: 70,
                              margin: const EdgeInsets.fromLTRB(30, 0, 0, 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Container(
                                    width: 110,
                                    height: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          "닫기",
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

// 메모창 하단 색 선택
  Widget _colorWidget(Color color) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          widget.p.changecolor = color;
        });
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 9),
          width: 55,
          height: 55,
          decoration:
              BoxDecoration(shape: BoxShape.circle, border: widget.p.color == color ? Border.all(color: Colors.white, width: 4) : null, color: color),
        ),
      ),
    );
  }
}
