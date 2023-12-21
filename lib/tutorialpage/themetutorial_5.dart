import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/themepage/themepage_5.dart';

final skyblue = 0x99add8e6;

class ThemeTuto5 extends StatefulWidget{
  final int PlayTime;
  ThemeTuto5({required this.PlayTime});

  @override
  State<ThemeTuto5> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ThemeTuto5>{
  CarouselController carouselController = CarouselController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // 하단 바 삭제

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Center(
          child: Container(
            child: AppBar(
              backgroundColor: Color(skyblue),
              flexibleSpace: Center(
                child: Container(
                  child: Text('튜토리얼5',
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
          SizedBox(
              child: DecoratedBox(

                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 480,
                      height: 658,
                      color: Colors.blueAccent,
                      child: CarouselSlider(
                        carouselController: carouselController,

                        items: [1, 2, 3, 4, 5].map(
                              (i) {
                            if (i == 1) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Image.asset('images/1.png'),

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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Image.asset('images/2.png'),

                                        )
                                      ],

                                    )

                                );
                              });
                            }
                            if (i == 3){
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Image.asset('images/4.png'),

                                        )
                                      ],

                                    )

                                );
                              });
                            }
                            if (i == 4) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                          aspectRatio: 3/5,
                          viewportFraction: 1, // 좌우  여백
                          initialPage: 0, //처음 보여줄 페이지
                          enableInfiniteScroll: true, // 끝에 도달하면 반복
                          reverse: false, //반대 방향으로 스크롤
                          autoPlay: false, // 다음페이지 자동 실행
                          autoPlayCurve: Curves.fastOutSlowIn, // 화면 전환 애니메이션
                          //onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                          // 옆으로 스크롤
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(240, 35, 0, 0),
                height: 80, // 세로
                width: 130, // 가로
                decoration: BoxDecoration(
                    color: Colors.black54,  // 상자 크기
                    borderRadius: BorderRadius.circular(20) // 모서리 둥굴게
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push( // 버튼 클릭시 ThemeScreen1으로 이동
                        context,
                        MaterialPageRoute(builder: (context)=> ThemeScreen5(PlayTime: widget.PlayTime))
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,  // 가운데 정렬
                    children: [
                      Text(
                        "시작하기",
                        style: TextStyle(
                            fontSize: 28, // 글자 크기
                            color: Colors.white,  //글자 색
                            letterSpacing: 1.0, // 글자 간격
                            fontWeight: FontWeight.bold // 글자 두껍게
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )

        ],
      ),


    );
  }
}

