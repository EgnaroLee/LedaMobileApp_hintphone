// ignore_for_file: prefer_const_declarations, non_constant_identifier_names, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

// ignore: unnecessary_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:hint_app_7/tutorialpage/themetutorial_1.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_2.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_3.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_4.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_5.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_6.dart';

final skyblue = 0x99add8e6;
final darkblue = 0x99778899;

final red1 = 0x99CD5C5C;
final red2 = 0x99FA8072;
final red3 = 0x99FFE4E1;

final orange1 = 0x99D2691E;
final orange2 = 0x99FF8C00;
final orange3 = 0x99FFEBCD;

final yellow1 = 0x99DAA520;
final yellow2 = 0x99FFD700;
final yellow3 = 0x99FFFFE0;

final green1 = 0x998FBC8F;  // 다크 씨그린
final green2 = 0x9990EE90;  // 팔레 그린
final green3 = 0x99F0FFF0;  // 허니듀

final purple1 = 0x998C83CC;
final purple2 = 0x99C0B2DB;
final purple3 = 0x99F0F0FA;


class StartPage extends StatefulWidget {
  const StartPage({super.key});

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
    double screenHeight = mediaQuery.size.height;

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
                  width: screenWidth,
                  //   height: screenHeight,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: screenHeight * 0.4,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
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
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(), // 옆으로 스크롤 중지
                        children: [
                          // 테마 1번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 1번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 1번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 1번 테마 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 1번 테마 기본 시간 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 1번 테마 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 1번 테마 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    // 1번 테마 인원 수 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 1번 테마 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //color: Colors.grey,
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //1번 테마 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _incrementCounter1();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.add,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 1번 테마 인원 수 container

                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText('$_counter1명', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 1번 테마 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter1();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 1번 테마 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 1번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 1번 테마 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  // color: Colors.white,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount1.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1, //here
                                                                                        //minFontSize: 18
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 1번 테마 시간 증가 감소 container

                                                                            Expanded(
                                                                              child: Container(
                                                                                // color: Colors.grey,
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //1번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime1();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //1번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime1();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 1번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime1();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 1번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime1();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 1번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          // color: Colors.white,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 1번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall1();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child: Container(
                                                                              // margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                              child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 1번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter1 ==
                                                                        0) {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto1(PlayTime: baseTime + _TimeCount1)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // 테마 2번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 2번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 2번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 2번 테마 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 2번 테마 기본 시간 전체 Container

                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 2번 테마 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 2번 테마 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    // 2번 테마 인원 수 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 2번 테마 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //color: Colors.grey,
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //2번 테마 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
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

                                                                        // 2번 테마 인원 수 container
                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText(
                                                                                    '$_counter2명',
                                                                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 2번 테마 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter2();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 2번 테마 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 2번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 2번 테마 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  // color: Colors.white,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount2.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1, //here
                                                                                        //minFontSize: 18
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 2번 테마 시간 증가 감소 container

                                                                            Expanded(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //2번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime2();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //2번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime2();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 2번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime2();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 1번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime2();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 2번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          // color: Colors.white,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 2번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall2();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child: Container(
                                                                              // margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                              child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 2번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter2 ==
                                                                        0) {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto2(PlayTime: baseTime + _TimeCount2)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // 테마 3번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 3번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 3번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 테마 3번 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 테마 3번 기본 시간 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 3번 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 테마 3번 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),

                                                    // 테마 3번 인원 수 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 테마 3번 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //color: Colors.grey,
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //테마 3번 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
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

                                                                        // 테마 3번 인원 수 container
                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText(
                                                                                    '$_counter3명',
                                                                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 테마 3번 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter3();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 테마 3번 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 3번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 테마 3번 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount3.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 테마 3번 시간 증가 감소 container
                                                                            Expanded(
                                                                              child: Container(
                                                                                // color: Colors.grey,
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //3번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime3();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //3번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime3();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 3번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime3();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 3번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime3();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 3번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 3번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall3();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child:
                                                                              Container(child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 3번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter3 ==
                                                                        0) {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto3(PlayTime: baseTime + _TimeCount3)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // 테마 4번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 4번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "4",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 4번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 4번 테마 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 4번 테마 기본 시간 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 4번 테마 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 4번 테마 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    // 4번 테마 인원 수 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 4번 테마 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //4번 테마 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
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

                                                                        // 4번 테마 인원 수 container

                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText(
                                                                                    '$_counter4명',
                                                                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 4번 테마 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter4();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 4번 테마 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 4번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 4번 테마 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  // color: Colors.white,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount4.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1, //here
                                                                                        //minFontSize: 18
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 4번 테마 시간 증가 감소 container

                                                                            Expanded(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //4번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime4();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //4번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime4();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 4번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime4();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 4번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime4();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 4번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          // color: Colors.white,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 4번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall4();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child: Container(
                                                                              // margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                              child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 4번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter4 ==
                                                                        0) {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto4(PlayTime: baseTime + _TimeCount4)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // 테마 5번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 5번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "5",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 5번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 5번 테마 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 5번 테마 기본 시간 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 5번 테마 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 5번 테마 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    // 5번 테마 인원 수 전체 Container

                                                    Flexible(
                                                      child: Container(
                                                        //width: 180,
                                                        //height: 120,
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 5번 테마 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //color: Colors.grey,
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        //5번 테마 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
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

                                                                        // 5번 테마 인원 수 container

                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText(
                                                                                    '$_counter5명',
                                                                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 5번 테마 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter5();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 5번 테마 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 5번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 5번 테마 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  // color: Colors.white,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount5.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1, // 글자 최대 1줄로 고정
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 5번 테마 시간 증가 감소 container

                                                                            Expanded(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //5번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime5();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //5번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime5();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 5번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime5();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 5번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime5();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 5번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          // color: Colors.white,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 5번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall5();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child: Container(
                                                                              // margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                                                              child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 5번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter5 ==
                                                                        0) {
                                                                      // 인원 수 0명인 경우
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto5(PlayTime: baseTime + _TimeCount5)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // 테마 6번
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // 테마 6번 이름 Contaier
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 10),
                                      child: Center(
                                        child: Text(
                                          "6",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 테마 6번 전체 Container
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      color: Color(skyblue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // 테마 6번 상단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    // 테마 6번 기본 시간 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 5,
                                                            top: 0),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 6번 기본 시간 text container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "기본 플레이 타임",
                                                                          style: TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 테마 6번 기본 시간 표시 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //margin: EdgeInsets.only( bottom: 15),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "60:00",
                                                                          style: TextStyle(
                                                                              fontSize: 38,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),

                                                    // 테마 6번 인원 수 전체 Container
                                                    Flexible(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0,
                                                            left: 5,
                                                            right: 10),
                                                        color: Color(darkblue),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 인원수 Text Container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            AutoSizeText(
                                                                          "플레이 인원 수",
                                                                          style: TextStyle(
                                                                              fontSize: 24,
                                                                              fontWeight: FontWeight.bold),
                                                                          maxLines:
                                                                              1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  flex: 3),

                                                              // 테마 6번 인원 수 container
                                                              Flexible(
                                                                  child:
                                                                      Container(
                                                                    //color: Colors.grey,
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        // 테마 6번 인원 수 증가 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
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

                                                                        // 테마 6번 인원 수 container

                                                                        Container(
                                                                          //color: Colors.white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(bottom: 5),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 5, right: 5),
                                                                                  child: AutoSizeText(
                                                                                    '$_counter6명',
                                                                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        // 테마 6번 인원 수 감소 container
                                                                        Container(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Container(
                                                                              color: Color(0x99778899),
                                                                              margin: EdgeInsets.all(5),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  _decrementCounter6();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 40,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  flex: 7),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              flex: 4),

                                          // 테마 6번 하단 전체 container
                                          Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 5),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                        child: Container(
                                                          color:
                                                              Color(darkblue),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 6번 변동시간 Text container
                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 10),
                                                                      child: Expanded(
                                                                          child: Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              AutoSizeText(
                                                                            "변동 시간",
                                                                            style:
                                                                                TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ))),
                                                                  flex: 3),

                                                              Flexible(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Center(
                                                                          child: Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            // 테마 6번 변동 시간 표시
                                                                            Expanded(
                                                                                child: Container(
                                                                              margin: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Center(
                                                                                child: Container(
                                                                                  // color: Colors.white,
                                                                                  child: Center(
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                      child: AutoSizeText(
                                                                                        '${_TimeCount6.toString().padLeft(2, '0')} : 00',
                                                                                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                                                        maxLines: 1, // 글자 최대 1줄로 고정
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )),

                                                                            // 테마 6번 시간 증가 감소 container

                                                                            Expanded(
                                                                              child: Container(
                                                                                // color: Colors.grey,
                                                                                margin: EdgeInsets.only(right: 5),
                                                                                child: Column(
                                                                                  children: [
                                                                                    // 1분 증가 감소 Container
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.only(top: 5),
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //6번 테마 1분 증가
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTime6();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('+1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            )),

                                                                                            //6번 테마 1분 감소
                                                                                            Expanded(
                                                                                                child: Container(
                                                                                              margin: EdgeInsets.only(right: 5, top: 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTime6();
                                                                                                },
                                                                                                child: Center(child: AutoSizeText('-1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 1)),
                                                                                              ),
                                                                                            ))
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ))),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                            child: Center(
                                                                                                child: Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          // 6번 테마 10분 증가
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _incrementTenTime6();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '+10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          )),

                                                                                          // 6번 테마 10분 감소
                                                                                          Expanded(
                                                                                              child: Container(
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                                                                              color: Color(0x99778899),
                                                                                              child: InkWell(
                                                                                                onTap: () {
                                                                                                  _decrementTenTime6();
                                                                                                },
                                                                                                child: Center(
                                                                                                    child: AutoSizeText(
                                                                                                  '-10',
                                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 1,
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ))
                                                                                        ],
                                                                                      ),
                                                                                    ))))
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                  flex: 7)
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 7),

                                                    // 테마 6번 버튼 Container
                                                    Flexible(
                                                        child: Container(
                                                          // color: Colors.white,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // 테마 6번 초기화 버튼
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10,
                                                                          bottom:
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          darkblue),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _delall6();
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Expanded(
                                                                          child:
                                                                              Container(child: AutoSizeText("초기화", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5), maxLines: 1))),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // 테마 6번 튜토리얼 버튼
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        darkblue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (_counter6 ==
                                                                        0) {
                                                                      // 인원 수 0명인 경우
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                AlertDialog(
                                                                          title:
                                                                              Text(''),
                                                                          content:
                                                                              Text(
                                                                            '인원수를 입력해주세요!',
                                                                            style:
                                                                                TextStyle(fontSize: 20),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(
                                                                                  '확인',
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => ThemeTuto6(PlayTime: baseTime + _TimeCount6)));
                                                                    }
                                                                  },
                                                                  child: Center(
                                                                    child: Container(
                                                                        child: AutoSizeText(
                                                                            "튜토리얼",
                                                                            style: TextStyle(
                                                                                fontSize: 25,
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1.5),
                                                                            maxLines: 1)),
                                                                  ),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                        flex: 3)
                                                  ],
                                                ),
                                              ),
                                              flex: 6)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
