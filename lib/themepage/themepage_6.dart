import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';


final skyblue = 0x99ADD8E6;

bool isSliderTouched = false;

class DotInfo {
  DotInfo(this.offset, this.size, this.color);
  final Offset offset;
  final double size;
  final Color color;
}

class DrawingP with ChangeNotifier{  //provider
  final lines = <List<DotInfo>>[];
  double _size = 3;
  double get size => _size;

  set changeSize(double size){
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

  void changeEraseMode(){
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
        if (sqrt(pow(offset.dx - oneDot.offset.dx, 2) +
            pow(offset.dy - oneDot.offset.dy, 2)) <
            _eraseRound) {
          lines.remove(oneLine);
          break;
        }
      }
    }
    notifyListeners();
  }

}

class DrawingPainter extends CustomPainter{
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;
  @override
  void paint(Canvas canvas, Size size){
    for (var oneLine in lines){
      Color? color;
      double? size;
      var l = <Offset>[];
      var p = Path();
      for(var oneDot in oneLine){
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(p, Paint()
        ..color = color!
        ..strokeWidth = size!
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
      );
    }

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}

class ThemeScreen6 extends StatefulWidget{
  final int PlayTime;
  ThemeScreen6({required this.PlayTime});

  @override
  State<ThemeScreen6> createState() => _ThemeScreen6State();
}

class _ThemeScreen6State extends State<ThemeScreen6> with SingleTickerProviderStateMixin{

  // 그림판 provider
  var p = DrawingP();

  // 중간 탭
  late TabController _tabController;
  final List<String> _tablabels = [
    '힌트', '진행률'
  ];

  // textfeid 내용
  TextEditingController _hintText = TextEditingController();
  TextEditingController _percentText = TextEditingController();

  // 힌트 코드
  var _word = "";
  var _hintcode1 = "Hello";
  var _hintcode2 = "두번째 힌트";
  var _hintcode3 = "세번째 힌트";
  var _hintcode4 = "네번째 힌트";

  //퍼센트
  var _percentwords = "0";
  double _percent = 0;

  // 타이머
  late Timer _timer;
  int _currentMinutes = 0;
  int _currentSeconds = 0;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: _tablabels.length, vsync: this);
    _initializeTimer();
  }

  // 타이머 기능
  void _initializeTimer(){
    _currentMinutes = widget.PlayTime;
    _currentSeconds = 0;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_currentSeconds > 0) {
          _currentSeconds--;
        }

        else{
          if(_currentMinutes >0){
            _currentMinutes--;
            _currentSeconds = 59;
          }
          else{
            _timer.cancel();
          }
        }
      });
    });
  }

  @override void dispose(){
    _tabController.dispose();
    super.dispose();
    _hintText.dispose();
    _percentText.dispose();
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child:  Center(
            child:Container(
              child: AppBar(
                //centerTitle: true,
                  backgroundColor: Color(skyblue),
                  flexibleSpace: Container(
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: Image.asset("images/logo.png"),
                  )

              ),
            ),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 380,
                  height: 150,
                  color: Color(skyblue),
                  child: Center(
                    child: Container(
                      width: 360,
                      height: 70,
                      child: Text(
                        '${_currentMinutes.toString().padLeft(2, '0')} : ${_currentSeconds.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.5,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0
                          ),
                          itemCount: 3,
                          itemBuilder: (context, index){
                            if(index == 0){
                              return GestureDetector(

                                  onTap: (){
                                    _tabController.animateTo(index);

                                  },
                                  child: Center(

                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                      width: 120,
                                      height: 100,
                                      color: Color(0x99ADD8E6),

                                      child: Center(
                                        child: Text(
                                          "힌트",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                    ),

                                  )

                              );
                            }
                            if(index == 1){
                              return GestureDetector(
                                  onTap: (){
                                    FocusScope.of(context).unfocus();
                                    _tabController.animateTo(index);
                                  },

                                  child: Center(

                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),

                                      width: 120,
                                      height: 100,
                                      color: Color(0x99ADD8E6),

                                      child: Center(
                                        child: Text(
                                          "진행률",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                  )
                              );
                            }
                          }
                      ),

                      Container(
                        margin: const EdgeInsets.fromLTRB(276, 20, 0, 0),
                        width: 120,
                        height: 70,
                        color: Color(skyblue),
                        child: Center(
                          child: Container(
                            child: InkWell(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return _showPaint(p: p);
                                    });
                              },
                              child: Center(

                                child: Text(
                                  "메모",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            width: 390,
                            height: 440,
                            color: Color(skyblue),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
                            child: Text(
                              "Hint",
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 80, 0, 0),
                                width: 260,
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    color: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: TextField(
                                        controller: _hintText,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '입력',
                                        ),
                                        style: TextStyle(fontSize: 25),
                                        onChanged: (text) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(280, 90, 0, 0),
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: InkWell(
                              onTap: ()async{
                                FocusScope.of(context).unfocus();
                                if (_hintText.text == 'hi') {
                                  setState(() {
                                    _word = _hintcode1;
                                    _hintText.text = '';
                                  });
                                }

                                else if (_hintText.text == '2') {
                                  setState(() {
                                    _word = _hintcode2;
                                    _hintText.text = '';
                                  });
                                }

                                else if (_hintText.text == '3') {
                                  setState(() {
                                    _word = _hintcode3;
                                    _hintText.text = '';
                                  });
                                }

                                else if (_hintText.text == '4') {
                                  setState(() {
                                    _word = _hintcode4;
                                    _hintText.text = '';
                                  });
                                }
                                else if (_hintText.text == "") {
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

                                else {
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
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 170, 0, 0),
                            width: 350,
                            height: 270,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                _word,
                                style: TextStyle(fontSize: 40),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                              width: 390,
                              height: 440,
                              color: Color(skyblue)
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 120, 0, 0),
                            child: Text(
                              "진행률",
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 35, 0, 0),
                                width: 260,
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    color: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: TextField(
                                        controller: _percentText,
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
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(280, 45, 0, 0),
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: InkWell(
                              onTap: () async{
                                FocusScope.of(context).unfocus();
                                if (_percentText.text == 'hi') {
                                  setState(() {
                                    _percent = 0.25;
                                    _percentwords = '25';
                                    _percentText.text = '';
                                  }
                                  );
                                }

                                else if (_percentText.text == "2") {
                                  setState(() {
                                    _percent = 0.5;
                                    _percentwords = '50';
                                    _percentText.text = '';
                                  }
                                  );
                                }

                                else if (_percentText.text == "3") {
                                  setState(() {
                                    _percent = 0.75;
                                    _percentwords = "75";
                                    _percentText.text = '';
                                  }
                                  );
                                }

                                else if (_percentText.text == "4") {
                                  setState(() {
                                    _percent = 0.9;
                                    _percentwords = "90";
                                    _percentText.text = '';
                                  }
                                  );
                                }

                                else if (_percentText.text == "") {
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
                                  }
                                  );
                                }

                                else {
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
                                  }
                                  );
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "확인",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 120, 0, 0),
                            width: 370,
                            height: 130,
                            // color: Colors.white,
                            child: Center(
                              child: Container(
                                  child: LinearPercentIndicator(
                                    alignment: MainAxisAlignment.center,
                                    width: 370, // 바 넓이

                                    animation: true,
                                    animationDuration: 1200, // 애니메이션 지속 시간
                                    lineHeight: 40,
                                    percent: _percent,
                                    center: Text(
                                      '$_percentwords%',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    barRadius: Radius.circular(13),
                                    progressColor: Colors.black54,
                                  )),
                            ),

                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 230, 0, 0),
                            width: 350,
                            height: 40,
                            // color: Colors.white,
                            child: Text(
                              "힌트 사용 목록",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30, 270, 0, 0),
                            width: 350,
                            height: 170,
                            color: Colors.white,
                            child: Text(
                              "",
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }


}

class _showPaint extends StatefulWidget{
  final DrawingP p;

  _showPaint({required this.p});

  @override
  _showPaintState createState() => _showPaintState();
}

class _showPaintState extends State<_showPaint>{
// var p = DrawingP();
  bool isSliderTouched = false;

  @override
  Widget build(BuildContext context){
    return Dialog(
        child: Container(
          width: 400,
          height: 800,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: CustomPaint(
                              painter: DrawingPainter(widget.p.lines)
                          )
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanStart: (s){
                          if(widget.p.erasemode){
                            setState(() {
                              widget.p.erase(s.localPosition);
                            });
                          }

                          else{
                            setState(() {
                              widget.p.drawStart(s.localPosition);
                            });
                          }
                        },
                        onPanUpdate: (s){
                          if(widget.p.erasemode){
                            setState(() {
                              widget.p.erase(s.localPosition);
                            });
                          }

                          else{
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
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom
                ),
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
                                onChanged: (size){
                                  if(!isSliderTouched){
                                    setState(() {
                                      widget.p.changeSize = size;
                                    });
                                  }
                                },
                                onChangeStart: (value){
                                  setState(() {
                                    isSliderTouched = true;
                                  });
                                },
                                onChangeEnd: (value){
                                  setState(() {
                                    isSliderTouched = false;
                                  });
                                },
                                min:3,
                                max:15,
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
                              onTap: (){
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
                                          borderRadius: BorderRadius.circular(20),
                                          color: widget.p.erasemode
                                              ? Colors.yellow
                                              :Colors.white
                                      ),
                                      child: Center(
                                        child: Text('지우개',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
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
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Center(
                                      child: Container(
                                        width: 110,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white
                                        ),
                                        child: Center(
                                          child: Container(
                                            child: Text("닫기",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ), textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              ),
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
        )
    );
  }

  Widget _colorWidget(Color color){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState(() {
          widget.p.changecolor = color;
        });
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 9),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: widget.p.color == color
                  ? Border.all(color: Colors.white, width: 4)
                  :null,
              color: color
          ),
        ),
      ),
    );
  }

}