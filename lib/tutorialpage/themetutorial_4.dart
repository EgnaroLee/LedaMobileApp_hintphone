import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/startpage.dart';
import 'package:hint_app_7/themepage/themepage_4.dart';
import 'package:auto_size_text/auto_size_text.dart';

final skyblue = 0x99add8e6;

class ThemeTuto4 extends StatefulWidget {
  final int PlayTime;
  ThemeTuto4({required this.PlayTime});

  @override
  State<ThemeTuto4> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ThemeTuto4> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    var mediaQuery = MediaQuery.of(context);

    double screenWidth = mediaQuery.size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(
            child: Container(
              child: AppBar(
                backgroundColor: Color(darkblue),
                flexibleSpace: Center(
                  child: Container(
                    child: Text(
                      '튜토리얼4',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: screenWidth,
            child: Column(children: [
              Flexible(
                  child: Center(
                    child: Container(
                      child: Expanded(
                        child: CarouselSlider(
                          carouselController: carouselController,
                          items: [1, 2, 3, 4, 5].map((i) {
                            if (i == 1) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Container(
                                      child: Image.asset('images/11.png'),
                                    ),
                                  );
                                },
                              );
                            }
                            if (i == 2) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Container(
                                      child: Image.asset('images/2.png'),
                                    ),
                                  );
                                },
                              );
                            }

                            if (i == 3) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Container(
                                      child: Image.asset('images/3.png'),
                                    ),
                                  );
                                },
                              );
                            }

                            if (i == 4) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Container(
                                      child: Image.asset('images/4.png'),
                                    ),
                                  );
                                },
                              );
                            }
                            if (i == 5) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Container(
                                      child: Image.asset('images/5.png'),
                                    ),
                                  );
                                },
                              );
                            }

                            return Builder(
                              builder: (BuildContext context) {
                                return Container();
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            aspectRatio: 2 / 3,
                            viewportFraction: 1, // 좌우  여백
                            initialPage: 0, //처음 보여줄 페이지
                            enableInfiniteScroll: true, // 끝에 도달하면 반복
                            enlargeCenterPage: true,
                            reverse: false, //반대 방향으로 스크롤
                            autoPlay: false, // 다음페이지 자동 실행
                            //     autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal, // 옆으로 스크롤
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 8),
              Flexible(
                  child: Container(
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.25,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Color(darkblue), borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeScreen4(PlayTime: widget.PlayTime)));
                          },
                          child: Center(
                            child: Container(
                              child: AutoSizeText(
                                "시작하기",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 1)
            ]),
          ),
        ));
  }
}