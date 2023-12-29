import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/startpage.dart';
import 'package:hint_app_7/themepage/themepage_6.dart';

final skyblue = 0x99add8e6;
final purple2 = 0x99C0B2DB;

class ThemeTuto6 extends StatefulWidget{

  final int PlayTime;
  ThemeTuto6({required this.PlayTime});

  @override
  State<ThemeTuto6> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ThemeTuto6>{
  CarouselController carouselController = CarouselController();


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Center(
          child: Container(
            child: AppBar(
              backgroundColor: Color(purple2),
              flexibleSpace: Center(
                child: Container(
                  child: Text('튜토리얼6',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),textAlign: TextAlign.center,),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                    child: Center(
                        child: Expanded(
                          child: Container(
                            child: Stack(
                              children: [
                                Center(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                                      child:CarouselSlider (
                                        carouselController: carouselController,
                                        items: [1, 2, 3, 4, 5].map(
                                              (i) {
                                            if (i == 1) {
                                              return Builder(builder: (BuildContext context) {
                                                return Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.white
                                                          ),
                                                          child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(1),
                                                              child: Image.asset('images/11.png',
                                                                fit: BoxFit.cover,)
                                                          ),

                                                        )
                                                      ],
                                                    )

                                                );
                                              });
                                            }

                                            if (i == 2){
                                              return Builder(builder: (BuildContext context) {
                                                return Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          child: Image.asset('images/2.png'),
                                                        )
                                                      ],

                                                    )
                                                );
                                              }
                                              );}

                                            if (i == 3){
                                              return Builder(builder: (BuildContext context) {
                                                return Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          child: Image.asset('images/4.png'),
                                                        )
                                                      ],
                                                    )

                                                );
                                              }
                                              );
                                            }
                                            if (i == 4) {
                                              return Builder(builder: (BuildContext context) {
                                                return Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          child: Image.asset('images/5.png'),

                                                        )
                                                      ],

                                                    )

                                                );
                                              });
                                            }
                                            if (i == 5) {
                                              return Builder(builder: (BuildContext context) {
                                                return Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          child: Image.asset('images/3.png'),

                                                        )
                                                      ],

                                                    )

                                                );
                                              });
                                            }

                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container();
                                              },
                                            );
                                          },
                                        ).toList(),
                                        options: CarouselOptions(
                                          aspectRatio: 2/3 ,
                                          viewportFraction: 1, // 좌우  여백
                                          initialPage: 0, //처음 보여줄 페이지
                                          enableInfiniteScroll: true, // 끝에 도달하면 반복
                                          enlargeCenterPage: true,
                                          reverse: false, //반대 방향으로 스크롤
                                          autoPlay: false, // 다음페이지 자동 실행
                                          autoPlayCurve: Curves.fastOutSlowIn, // 화면 전환 애니메이션
                                          //onPageChanged: (index, reason) {},
                                          scrollDirection: Axis.horizontal,
                                          // 옆으로 스크롤
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        )

                    )
                ),
                Container(
                    child: Center(
                      child: Container(
                          margin: EdgeInsets.only( top: 40),
                          height: 70,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Color(purple2),  // 상자 크기
                              borderRadius: BorderRadius.circular(20) // 모서리 둥굴게
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> ThemeScreen6(PlayTime: widget.PlayTime)
                                  )
                              );
                            },
                            child: Center(
                              child: Container(
                                child: Text("시작하기",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    )
                )
              ],
            ),
          ),


        ],
      ),


    );
  }
}

