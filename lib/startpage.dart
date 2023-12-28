import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_1.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_2.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_3.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_4.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_5.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_6.dart';

final skyblue = 0x99add8e6;
final darkblue = 0x99778899;
final a = 0x991234;

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tablabels = [
    '1번 테마',
    '2번테마',
    '3번 테마',
    '4번 테마',
    '5번 테마',
    '6번 테마'
  ];

  int _counter1 = 0; // 1번 테마 인원수 조정
  int _counter2 = 0; // 2번 테마 인원수 조정
  int _counter3 = 0; // 3번 테마 인원수 조정
  int _counter4 = 0; // 4번 테마 인원수 조정
  int _counter5 = 0; // 5번 테마 인원수 조정
  int _counter6 = 0; // 6번 테마 인원수 조정

  int _TimeCount1 = 0; // 1번 테마 시간 조정
  int _TimeCount2 = 0; // 2번 테마 시간 조정
  int _TimeCount3 = 0; // 3번 테마 시간 조정
  int _TimeCount4 = 0; // 4번 테마 시간 조정
  int _TimeCount5 = 0; // 5번 테마 시간 조정
  int _TimeCount6 = 0; // 6번 테마 시간 조정

  int baseTime = 60;

  @override
  void initState() {
    super.initState();
    // tabController 개수 = _tablabels
    _tabController = TabController(length: _tablabels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    var mediaQuery = MediaQuery.of(context);

    double screenWidth = mediaQuery.size.width;
    double screenHeignt = mediaQuery.size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(110),
            child: Center(
              child: Container(
                child: AppBar(
                    backgroundColor: Color(skyblue),
                    flexibleSpace: Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset("images/logo3.png"),
                      ),
                    )),
              ),
            )),
        body: WillPopScope(
            onWillPop: () {
              return Future(() => false);
            },
            child: Center(
              child: Container(
                // width: screenWidth,
                //  height: screenHeignt * 0.8,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          // 그리드 배치
                          crossAxisCount: 2, // 한 행당 위젯 개수
                          childAspectRatio: 1.7, // 가로 세로 비율
                          mainAxisSpacing: 2, // 세로 여백
                          crossAxisSpacing: 10, // 가로 여백
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // index가 0번인 경우
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/a1.png"),
                            );
                          }
                          if (index == 1) {
                            // index가 1번인 경우
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/b1.png"),
                            );
                          }
                          if (index == 2) {
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/c1.png"),
                            );
                          }
                          if (index == 3) {
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/d1.png"),
                            );
                          }
                          if (index == 4) {
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/e1.png"),
                            );
                          }

                          if (index == 5) {
                            return GestureDetector(
                              onTap: () {
                                _tabController.animateTo(index);
                              },
                              child: Image.asset("images/a1.png"),
                            );
                          }
                        },
                      ),
                      Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            physics: NeverScrollableScrollPhysics(), // 옆으로 스크롤 중지
                            children: [
                              // 테마 1번
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Stack(
                                    children: [
                                      // 테마 이름 Contaier
                                      Center(
                                        child:  Container(
                                          margin:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 340),
                                          padding: EdgeInsets.only(top:0, bottom: 0),
                                          //width: 390,
                                          //height: 35,
                                          //color: Colors.grey[300],
                                          child: Center(
                                            child: Text( "1",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // 테마 1번 전체 Container
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 40, bottom:10),
                                          // width: 390,
                                          //height: 300,
                                          color: Color(skyblue),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    // 1번 테마 기본 시간 전체 Container
                                                    Expanded(
                                                      child: Container(
                                                        // width: 180,
                                                        //height: 120,
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            top: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              // 1번 테마 기본 시간 text container
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets.only(top: 10),
                                                                    child: Text( "기본 플레이 타임",
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 1번 테마 기본 시간 표시 container
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets.only(top:15),
                                                                    child: Text("60:00",
                                                                      style: TextStyle(
                                                                          fontSize:35,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // 1번 테마 인원 수 전체 Container
                                                    Container(
                                                      //width: 180,
                                                      //height: 120,
                                                      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                                                      color: Color(darkblue),
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            // 인원수 Text Container
                                                            Container(
                                                              child: Center(
                                                                child: Container(
                                                                  margin: EdgeInsets.only(top: 10),
                                                                  child: Text(
                                                                    "플레이 인원 수",
                                                                    style: TextStyle(
                                                                        fontSize: 20,
                                                                        fontWeight: FontWeight.bold),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            // 인원 수 container
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  // 인원 수 증가 container
                                                                  Container(
                                                                    width: 40,
                                                                    height: 40,

                                                                    margin: EdgeInsets.only(
                                                                        top: 15,
                                                                        left: 15
                                                                    ),
                                                                    color: Color(0x99778899),
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child:
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _incrementCounter1();
                                                                          },
                                                                          child:
                                                                          Icon(Icons.add,size:40),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  // 인원 수 container
                                                                  Container(
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top: 10),

                                                                        width: 70,
                                                                        height: 50,

                                                                        child:
                                                                        Center(
                                                                          child:
                                                                          Container(
                                                                            child:
                                                                            Text(
                                                                              '$_counter1명',
                                                                              style: TextStyle(
                                                                                  fontSize: 35,
                                                                                  fontWeight: FontWeight.bold),
                                                                              textAlign:
                                                                              TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  // 인원 수 감소 container
                                                                  Container(
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top: 15
                                                                        ),

                                                                        color: Color(0x99778899),
                                                                        width: 40,
                                                                        height: 40,
                                                                        child:
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            _decrementCounter1();
                                                                          },
                                                                          child:
                                                                          Icon(
                                                                            Icons
                                                                                .remove,
                                                                            size:
                                                                            40,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              // 변동 시간 전체 container
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10, left: 10),
                                                      width: 255,
                                                      height: 150,
                                                      color: Color(darkblue),
                                                      child: Column(
                                                        children: [
                                                          // 테마 1번 변동시간 Text container
                                                          Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "변동 시간",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),

                                                          Center(
                                                            child: Row(
                                                              children: [
                                                                // 1번 테마 변동 시간 표시
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      width: 120,
                                                                      height: 100,
                                                                      child: Center(
                                                                        child:
                                                                        Container(
                                                                          child:
                                                                          Text(
                                                                            '${_TimeCount1.toString().padLeft(2, '0')} : 00',
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                30,
                                                                                fontWeight:
                                                                                FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),

                                                                // 1번 테마 시간 증가 감소 container
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets
                                                                            .only(
                                                                            top:
                                                                            5),
                                                                        child: Row(
                                                                          children: [
                                                                            //1번 테마 1분 증가
                                                                            Container(
                                                                              child:
                                                                              Container(
                                                                                color:
                                                                                Color(0x99778899),
                                                                                width:
                                                                                50,
                                                                                height:
                                                                                40,
                                                                                child:
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    _incrementTime1();
                                                                                  },
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                        '+1',
                                                                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            //1번 테마 1분 감소
                                                                            Container(
                                                                              child:
                                                                              Container(
                                                                                margin:
                                                                                EdgeInsets.only(left: 10),
                                                                                color:
                                                                                Color(0x99778899),
                                                                                width:
                                                                                50,
                                                                                height:
                                                                                40,
                                                                                child:
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    _decrementTime1();
                                                                                  },
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                        '-1',
                                                                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Row(
                                                                          children: [
                                                                            // 1번 테마 10분 증가
                                                                            Container(
                                                                              child:
                                                                              Container(
                                                                                margin:
                                                                                EdgeInsets.only(top: 10, left: 0),
                                                                                color:
                                                                                Color(0x99778899),
                                                                                width:
                                                                                50,
                                                                                height:
                                                                                40,
                                                                                child:
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    _incrementTenTime1();
                                                                                  },
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                        '+10',
                                                                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            // 1번 테마 10분 감소
                                                                            Container(
                                                                              child:
                                                                              Container(
                                                                                margin:
                                                                                EdgeInsets.only(top: 10, left: 10),
                                                                                color:
                                                                                Color(0x99778899),
                                                                                width:
                                                                                50,
                                                                                height:
                                                                                40,
                                                                                child:
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    _decrementTenTime1();
                                                                                  },
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                        '-10',
                                                                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                        textAlign: TextAlign.center,
                                                                                      )),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          // 테마 1번 초기화 버튼
                                                          Container(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 5),
                                                              height: 60,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      darkblue),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15)),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  _delall1();
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    "초기화",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        25,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        letterSpacing:
                                                                        1.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          // 테마 1번 튜토리얼 버튼
                                                          Container(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 15),
                                                              height: 60,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      darkblue),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15)),
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  if (_counter1 ==
                                                                      0) {
                                                                    showDialog(
                                                                      context:
                                                                      context,
                                                                      builder:
                                                                          (context) =>
                                                                          AlertDialog(
                                                                            title: Text(
                                                                                ''),
                                                                            content:
                                                                            Text(
                                                                              '인원수를 입력해주세요!',
                                                                              style: TextStyle(
                                                                                  fontSize:
                                                                                  20),
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .center,
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                  onPressed:
                                                                                      () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child:
                                                                                  Text(
                                                                                    '확인',
                                                                                    style:
                                                                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                    );
                                                                  } else {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder:
                                                                                (context) =>
                                                                                ThemeTuto1(PlayTime: baseTime + _TimeCount1)));
                                                                  }
                                                                },
                                                                child: Center(
                                                                  child: Container(
                                                                      child: Text(
                                                                          "튜토리얼",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              25,
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              letterSpacing:
                                                                              1.5))),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // 테마 2번
                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // (테마 2번) 제목 Container
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      width: 390,
                                      height: 35,
                                      //color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          "2",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    // (테마 2번) 전체 코드
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      width: 390,
                                      height: 300,
                                      color: Color(skyblue),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                // 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 2번) 플레이 타임 Text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "기본 플레이 타임",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 2번) 플레이 타임 시간 Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                              child: Text(
                                                                "60:00",
                                                                style: TextStyle(
                                                                    fontSize: 35,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // (테마 2번) 인원 수 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 2번) 인원 수 text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "플레이 인원 수",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 2번) 인원 수 전체 container
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // (테마 2번) 인원 수 증가 container
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                margin:
                                                                EdgeInsets.only(
                                                                    top: 15,
                                                                    left: 15),
                                                                color: Color(
                                                                    0x99778899),
                                                                child: Center(
                                                                  child: Container(
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _incrementCounter2();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 2번) 인원 수
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        10),
                                                                    width: 70,
                                                                    height: 50,
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child: Text(
                                                                          '$_counter2명',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              35,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 2번) 인원 수 감소
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        15),
                                                                    color: Color(
                                                                        0x99778899),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _decrementCounter2();
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  width: 255,
                                                  height: 150,
                                                  color: Color(darkblue),
                                                  child: Column(
                                                    children: [
                                                      //(테마 2번) 변동 시간 Text Container
                                                      Center(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 10),
                                                          child: Text(
                                                            "변동 시간",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            // (테마 2번) 테마 시간 Container
                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                              child: Center(
                                                                child: Container(
                                                                  width: 120,
                                                                  height: 100,
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      child: Text(
                                                                        '${_TimeCount2.toString().padLeft(2, '0')} : 00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            30,
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  // (테마 2번) 1분 Container
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 2번) 1분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTime2();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 2번) 1분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTime2();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // (테마 2번) 10분 Container
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 2번) 10분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                0),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTenTime2();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 2번) 10분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTenTime2();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      // 테마 2번 초기화 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 5),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _delall2();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "초기화",
                                                                style: TextStyle(
                                                                    fontSize: 25,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // 테마 2번 튜토리얼 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 15),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (_counter2 == 0) {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (context) =>
                                                                      AlertDialog(
                                                                        title: Text(''),
                                                                        content: Text(
                                                                          '인원수를 입력해주세요!',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              20),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Navigator.pop(
                                                                                    context);
                                                                              },
                                                                              child:
                                                                              Text(
                                                                                '확인',
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    18,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                );
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ThemeTuto2(
                                                                                PlayTime:
                                                                                baseTime + _TimeCount2)));
                                                              }
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                  child: Text(
                                                                      "튜토리얼",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          25,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                          1.5))),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 테마 3번
                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // (테마 3번) 제목 Container
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      width: 390,
                                      height: 35,
                                      //color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          "3",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    // (테마 3번) 전체 코드
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      width: 390,
                                      height: 300,
                                      color: Color(skyblue),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                // 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 3번) 플레이 타임 Text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "기본 플레이 타임",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 3번) 플레이 타임 시간 Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                              child: Text(
                                                                "60:00",
                                                                style: TextStyle(
                                                                    fontSize: 35,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // (테마 3번) 인원 수 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 3번) 인원 수 text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "플레이 인원 수",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 3번) 인원 수 전체 container
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // (테마 3번) 인원 수 증가 container
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                margin:
                                                                EdgeInsets.only(
                                                                    top: 15,
                                                                    left: 15),
                                                                color: Color(
                                                                    0x99778899),
                                                                child: Center(
                                                                  child: Container(
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _incrementCounter3();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 3번) 인원 수
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        10),
                                                                    width: 70,
                                                                    height: 50,
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child: Text(
                                                                          '$_counter3명',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              35,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 3번) 인원 수 감소
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        15),
                                                                    color: Color(
                                                                        0x99778899),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _decrementCounter3();
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  width: 255,
                                                  height: 150,
                                                  color: Color(darkblue),
                                                  child: Column(
                                                    children: [
                                                      //(테마 3번) 변동 시간 Text Container
                                                      Center(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 10),
                                                          child: Text(
                                                            "변동 시간",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            // (테마 3번) 테마 시간 Container
                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                              child: Center(
                                                                child: Container(
                                                                  width: 120,
                                                                  height: 100,
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      child: Text(
                                                                        '${_TimeCount3.toString().padLeft(2, '0')} : 00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            30,
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  // (테마 3번) 1분 Container
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 3번) 1분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTime3();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 3번) 1분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTime3();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // (테마 3번) 10분 Container
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 3번) 10분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                0),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTenTime3();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 3번) 10분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTenTime3();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      // 테마 3번 초기화 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 5),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _delall3();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "초기화",
                                                                style: TextStyle(
                                                                    fontSize: 25,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // 테마 3번 튜토리얼 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 15),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (_counter3 == 0) {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (context) =>
                                                                      AlertDialog(
                                                                        title: Text(''),
                                                                        content: Text(
                                                                          '인원수를 입력해주세요!',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              20),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Navigator.pop(
                                                                                    context);
                                                                              },
                                                                              child:
                                                                              Text(
                                                                                '확인',
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    18,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                );
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ThemeTuto3(
                                                                                PlayTime:
                                                                                baseTime + _TimeCount3)));
                                                              }
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                  child: Text(
                                                                      "튜토리얼",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          25,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                          1.5))),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 테마 4번
                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // (테마 4번) 제목 Container
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      width: 390,
                                      height: 35,
                                      //color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          "4",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    // (테마 4번) 전체 코드
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      width: 390,
                                      height: 300,
                                      color: Color(skyblue),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                // 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 4번) 플레이 타임 Text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "기본 플레이 타임",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 4번) 플레이 타임 시간 Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                              child: Text(
                                                                "60:00",
                                                                style: TextStyle(
                                                                    fontSize: 35,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // (테마 4번) 인원 수 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 4번) 인원 수 text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "플레이 인원 수",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 4번) 인원 수 전체 container
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // (테마 4번) 인원 수 증가 container
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                margin:
                                                                EdgeInsets.only(
                                                                    top: 15,
                                                                    left: 15),
                                                                color: Color(
                                                                    0x99778899),
                                                                child: Center(
                                                                  child: Container(
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _incrementCounter4();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 4번) 인원 수
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        10),
                                                                    width: 70,
                                                                    height: 50,
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child: Text(
                                                                          '$_counter4명',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              35,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 4번) 인원 수 감소
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        15),
                                                                    color: Color(
                                                                        0x99778899),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _decrementCounter4();
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  width: 255,
                                                  height: 150,
                                                  color: Color(darkblue),
                                                  child: Column(
                                                    children: [
                                                      //(테마 4번) 변동 시간 Text Container
                                                      Center(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 10),
                                                          child: Text(
                                                            "변동 시간",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            // (테마 4번) 테마 시간 Container
                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                              child: Center(
                                                                child: Container(
                                                                  width: 120,
                                                                  height: 100,
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      child: Text(
                                                                        '${_TimeCount4.toString().padLeft(2, '0')} : 00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            30,
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  // (테마 4번) 1분 Container
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 4번) 1분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTime4();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 4번) 1분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTime4();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // (테마 4번) 10분 Container
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 4번) 10분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                0),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTenTime4();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 4번) 10분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTenTime4();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      // 테마 4번 초기화 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 5),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _delall4();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "초기화",
                                                                style: TextStyle(
                                                                    fontSize: 25,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // 테마 4번 튜토리얼 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 15),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (_counter4 == 0) {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (context) =>
                                                                      AlertDialog(
                                                                        title: Text(''),
                                                                        content: Text(
                                                                          '인원수를 입력해주세요!',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              20),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Navigator.pop(
                                                                                    context);
                                                                              },
                                                                              child:
                                                                              Text(
                                                                                '확인',
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    18,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                );
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ThemeTuto4(
                                                                                PlayTime:
                                                                                baseTime + _TimeCount4)));
                                                              }
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                  child: Text(
                                                                      "튜토리얼",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          25,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                          1.5))),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 테마 5번
                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // (테마 5번) 제목 Container
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      width: 390,
                                      height: 35,
                                      //color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          "5",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    // (테마 5번) 전체 코드
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      width: 390,
                                      height: 300,
                                      color: Color(skyblue),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                // 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 5번) 플레이 타임 Text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "기본 플레이 타임",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 5번) 플레이 타임 시간 Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                              child: Text(
                                                                "60:00",
                                                                style: TextStyle(
                                                                    fontSize: 35,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // (테마 5번) 인원 수 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 5번) 인원 수 text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "플레이 인원 수",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 5번) 인원 수 전체 container
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // (테마 5번) 인원 수 증가 container
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                margin:
                                                                EdgeInsets.only(
                                                                    top: 15,
                                                                    left: 15),
                                                                color: Color(
                                                                    0x99778899),
                                                                child: Center(
                                                                  child: Container(
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _incrementCounter5();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 5번) 인원 수
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        10),
                                                                    width: 70,
                                                                    height: 50,
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child: Text(
                                                                          '$_counter5명',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              35,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 5번) 인원 수 감소
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        15),
                                                                    color: Color(
                                                                        0x99778899),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _decrementCounter5();
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  width: 255,
                                                  height: 150,
                                                  color: Color(darkblue),
                                                  child: Column(
                                                    children: [
                                                      //(테마 5번) 변동 시간 Text Container
                                                      Center(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 10),
                                                          child: Text(
                                                            "변동 시간",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            // (테마 5번) 테마 시간 Container
                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                              child: Center(
                                                                child: Container(
                                                                  width: 120,
                                                                  height: 100,
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      child: Text(
                                                                        '${_TimeCount5.toString().padLeft(2, '0')} : 00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            30,
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  // (테마 5번) 1분 Container
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 5번) 1분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTime5();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 5번) 1분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTime5();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // (테마 5번) 10분 Container
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 5번) 10분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                0),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTenTime5();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 5번) 10분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTenTime5();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      // 테마 5번 초기화 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 5),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _delall5();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "초기화",
                                                                style: TextStyle(
                                                                    fontSize: 25,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // 테마 5번 튜토리얼 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 15),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (_counter5 == 0) {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (context) =>
                                                                      AlertDialog(
                                                                        title: Text(''),
                                                                        content: Text(
                                                                          '인원수를 입력해주세요!',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              20),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Navigator.pop(
                                                                                    context);
                                                                              },
                                                                              child:
                                                                              Text(
                                                                                '확인',
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    18,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                );
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ThemeTuto5(
                                                                                PlayTime:
                                                                                baseTime + _TimeCount5)));
                                                              }
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                  child: Text(
                                                                      "튜토리얼",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          25,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                          1.5))),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 테마 6번
                              Container(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    // (테마 6번) 제목 Container
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      width: 390,
                                      height: 35,
                                      //color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          "6",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    // (테마 6번) 전체 코드
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      width: 390,
                                      height: 300,
                                      color: Color(skyblue),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                // 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 6번) 플레이 타임 Text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "기본 플레이 타임",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 6번) 플레이 타임 시간 Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 15),
                                                              child: Text(
                                                                "60:00",
                                                                style: TextStyle(
                                                                    fontSize: 35,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // (테마 6번) 인원 수 전체 Container
                                                Container(
                                                  width: 180,
                                                  height: 120,
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  color: Color(darkblue),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        // (테마 6번) 인원 수 text Container
                                                        Container(
                                                          child: Center(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                              child: Text(
                                                                "플레이 인원 수",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                                textAlign: TextAlign
                                                                    .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        // (테마 6번) 인원 수 전체 container
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              // (테마 6번) 인원 수 증가 container
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                margin:
                                                                EdgeInsets.only(
                                                                    top: 15,
                                                                    left: 15),
                                                                color: Color(
                                                                    0x99778899),
                                                                child: Center(
                                                                  child: Container(
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _incrementCounter6();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 6번) 인원 수
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        10),
                                                                    width: 70,
                                                                    height: 50,
                                                                    child: Center(
                                                                      child:
                                                                      Container(
                                                                        child: Text(
                                                                          '$_counter6명',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              35,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // (테마 6번) 인원 수 감소
                                                              Container(
                                                                child: Center(
                                                                  child: Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top:
                                                                        15),
                                                                    color: Color(
                                                                        0x99778899),
                                                                    width: 40,
                                                                    height: 40,
                                                                    child: InkWell(
                                                                      onTap: () {
                                                                        _decrementCounter6();
                                                                      },
                                                                      child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size: 40,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  width: 255,
                                                  height: 150,
                                                  color: Color(darkblue),
                                                  child: Column(
                                                    children: [
                                                      //(테마 6번) 변동 시간 Text Container
                                                      Center(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 10),
                                                          child: Text(
                                                            "변동 시간",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            // (테마 6번) 테마 시간 Container
                                                            Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                              child: Center(
                                                                child: Container(
                                                                  width: 120,
                                                                  height: 100,
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      child: Text(
                                                                        '${_TimeCount6.toString().padLeft(2, '0')} : 00',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            30,
                                                                            fontWeight:
                                                                            FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  // (테마 6번) 1분 Container
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                        top: 5),
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 6번) 1분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTime6();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 6번) 1분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTime6();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-1',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // (테마 6번) 10분 Container
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        // (테마 6번) 10분 증가 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                0),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _incrementTenTime6();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '+10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // (테마 6번) 10분 감소 Container
                                                                        Container(
                                                                          child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(
                                                                                top:
                                                                                10,
                                                                                left:
                                                                                10),
                                                                            color: Color(
                                                                                0x99778899),
                                                                            width:
                                                                            50,
                                                                            height:
                                                                            40,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                _decrementTenTime6();
                                                                              },
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    '-10',
                                                                                    style:
                                                                                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                    textAlign:
                                                                                    TextAlign.center,
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      // 테마 6번 초기화 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 5),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _delall6();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "초기화",
                                                                style: TextStyle(
                                                                    fontSize: 25,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // 테마 6번 튜토리얼 버튼 Continer
                                                      Container(
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: 15, top: 15),
                                                          height: 60,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Color(darkblue),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15)),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (_counter6 == 0) {
                                                                showDialog(
                                                                  context: context,
                                                                  builder:
                                                                      (context) =>
                                                                      AlertDialog(
                                                                        title: Text(''),
                                                                        content: Text(
                                                                          '인원수를 입력해주세요!',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                              20),
                                                                          textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Navigator.pop(
                                                                                    context);
                                                                              },
                                                                              child:
                                                                              Text(
                                                                                '확인',
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    18,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              ))
                                                                        ],
                                                                      ),
                                                                );
                                                              } else {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            ThemeTuto6(
                                                                                PlayTime:
                                                                                baseTime + _TimeCount6)));
                                                              }
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                  child: Text(
                                                                      "튜토리얼",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          25,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                          1.5))),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
            )));
  }

  // 테마1번 인원수 조정
  void _incrementCounter1() {
    setState(() {
      if (_counter1 < 5) {
        _counter1++;
      }
    });
  }

  void _decrementCounter1() {
    setState(() {
      if (_counter1 > 0) {
        _counter1--;
      }
    });
  }

  //테마1번 시간 조정
  // +1분
  void _incrementTime1() {
    setState(() {
      _TimeCount1++;
    });
  }

  //-1분
  void _decrementTime1() {
    setState(() {
      _TimeCount1--;
    });
  }

  // +10분
  void _incrementTenTime1() {
    setState(() {
      _TimeCount1 += 10;
    });
  }

  // -10분
  void _decrementTenTime1() {
    setState(() {
      _TimeCount1 -= 10;
    });
  }

  //테마1번 초기화
  void _delall1() {
    setState(() {
      _TimeCount1 = 0;
      _counter1 = 0;
    });
  }

  //테마2번 인원 수 조정
  void _incrementCounter2() {
    setState(() {
      if (_counter2 < 5) {
        _counter2++;
      }
    });
  }

  void _decrementCounter2() {
    setState(() {
      if (_counter2 > 0) {
        _counter2--;
      }
    });
  }

//테마2번 시간 조정
// +1분
  void _incrementTime2() {
    setState(() {
      _TimeCount2++;
    });
  }

//-1분
  void _decrementTime2() {
    if (_TimeCount2 > -60) {
      setState(() {
        _TimeCount2--;
      });
    }
  }

// +10분
  void _incrementTenTime2() {
    setState(() {
      _TimeCount2 += 10;
    });
  }

// -10분
  void _decrementTenTime2() {
    if (_TimeCount2 > -51) {
      setState(() {
        _TimeCount2 -= 10;
      });
    }
  }

  //테마2번 초기화
  void _delall2() {
    setState(() {
      _TimeCount2 = 0;
      _counter2 = 0;
    });
  }

//테마3번 인원 수 조정
  void _incrementCounter3() {
    setState(() {
      if (_counter3 < 5) {
        _counter3++;
      }
    });
  }

  void _decrementCounter3() {
    setState(() {
      if (_counter3 > 0) {
        _counter3--;
      }
    });
  }

//테마3번 시간 조정
// +1분
  void _incrementTime3() {
    setState(() {
      _TimeCount3++;
    });
  }

//-1분
  void _decrementTime3() {
    if (_TimeCount3 > -60) {
      setState(() {
        _TimeCount3--;
      });
    }
  }

// +10분
  void _incrementTenTime3() {
    setState(() {
      _TimeCount3 += 10;
    });
  }

// -10분
  void _decrementTenTime3() {
    if (_TimeCount3 > -51) {
      setState(() {
        _TimeCount3 -= 10;
      });
    }
  }

  //테마3번 초기화
  void _delall3() {
    setState(() {
      _TimeCount3 = 0;
      _counter3 = 0;
    });
  }

//테마4번 인원 수 조정
  void _incrementCounter4() {
    setState(() {
      if (_counter4 < 5) {
        _counter4++;
      }
    });
  }

  void _decrementCounter4() {
    setState(() {
      if (_counter4 > 0) {
        _counter4--;
      }
    });
  }

//테마4번 시간 조정
// +1분
  void _incrementTime4() {
    setState(() {
      _TimeCount4++;
    });
  }

//-1분
  void _decrementTime4() {
    setState(() {
      _TimeCount4--;
    });
  }

// +10분
  void _incrementTenTime4() {
    setState(() {
      _TimeCount4 += 10;
    });
  }

// -10분
  void _decrementTenTime4() {
    if (_TimeCount4 > -51) {
      setState(() {
        _TimeCount4 -= 10;
      });
    }
  }

  //테마4번 초기화
  void _delall4() {
    setState(() {
      _TimeCount4 = 0;
      _counter4 = 0;
    });
  }

//테마5번 인원 수 조정
  void _incrementCounter5() {
    setState(() {
      if (_counter5 < 5) {
        _counter5++;
      }
    });
  }

  void _decrementCounter5() {
    setState(() {
      if (_counter5 > 0) {
        _counter5--;
      }
    });
  }

//테마5번 시간 조정
// +1분
  void _incrementTime5() {
    setState(() {
      _TimeCount5++;
    });
  }

//-1분
  void _decrementTime5() {
    if (_TimeCount5 > -60) {
      setState(() {
        _TimeCount5--;
      });
    }
  }

// +10분
  void _incrementTenTime5() {
    setState(() {
      _TimeCount5 += 10;
    });
  }

// -10분
  void _decrementTenTime5() {
    if (_TimeCount5 > -51) {
      setState(() {
        _TimeCount5 -= 10;
      });
    }
  }

  //테마5번 초기화
  void _delall5() {
    setState(() {
      _TimeCount5 = 0;
      _counter5 = 0;
    });
  }

//테마6번 인원 수 조정
  void _incrementCounter6() {
    setState(() {
      if (_counter6 < 5) {
        _counter6++;
      }
    });
  }

  void _decrementCounter6() {
    setState(() {
      if (_counter6 > 0) {
        _counter6--;
      }
    });
  }

//테마6번 시간 조정
// +1분
  void _incrementTime6() {
    setState(() {
      _TimeCount6++;
    });
  }

//-1분
  void _decrementTime6() {
    if (_TimeCount6 > -60) {
      setState(() {
        _TimeCount6--;
      });
    }
  }

// +10분
  void _incrementTenTime6() {
    setState(() {
      _TimeCount6 += 10;
    });
  }

// -10분
  void _decrementTenTime6() {
    if (_TimeCount6 > -51) {
      setState(() {
        _TimeCount6 -= 10;
      });
    }
  }

  //테마6번 초기화
  void _delall6() {
    setState(() {
      _TimeCount6 = 0;
      _counter6 = 0;
    });
  }
}
