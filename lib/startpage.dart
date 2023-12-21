import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_1.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_2.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_3.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_4.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_5.dart';
import 'package:hint_app_7/tutorialpage/themetutorial_6.dart';


final skyblue = 0x99add8e6;



class StartPage extends StatefulWidget {

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tablabels = [
    '1번 테마', '2번테마', '3번 테마', '4번 테마', '5번 테마', '6번 테마'
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
  void initState(){

    super.initState();
    // tabController 개수 = _tablabels
    _tabController = TabController(length: _tablabels.length, vsync: this);


  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        resizeToAvoidBottomInset: false,

        appBar:PreferredSize(
            preferredSize: Size.fromHeight(110),
            child: Center(
              child: Container(
                child: AppBar(
                  backgroundColor: Color(skyblue),
                  flexibleSpace: Container(
                    margin: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                    child: Image.asset("images/logo.png"),
                  ),
                ),
              ),
            )
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  // 그리드 배치
                  crossAxisCount: 2,  // 한 행당 위젯 개수
                  childAspectRatio: 1.5 , // 가로 세로 비율
                  mainAxisSpacing:  0,  // 세로 여백
                  crossAxisSpacing: 10, // 가로 여백
                ),
                itemCount: 6,
                itemBuilder: (context, index){
                  if(index == 0){ // index가 0번인 경우
                    return GestureDetector(
                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/a.png"),


                    );
                  }
                  if(index == 1){ // index가 1번인 경우
                    return GestureDetector(
                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/b.png"),

                    );
                  }
                  if(index == 2){
                    return GestureDetector(
                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/c.png"),

                    );
                  }
                  if(index == 3){
                    return GestureDetector(
                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/d.png"),

                    );
                  }
                  if(index == 4){
                    return GestureDetector(
                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/e.png"),

                    );
                  }

                  if(index == 5){
                    return GestureDetector(

                      onTap: () {
                        _tabController.animateTo(index);

                      },
                      child: Image.asset("images/a.png"),

                    );
                  }
                },
              ),
              Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),  // 옆으로 스크롤 중지
                    children: [

                      // 테마1번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [

                            // 테마1번 제목 부분 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390, // 가로
                              height: 30, // 세로

                              //테마 이름 들어갈 곳
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                              ),

                            ),

                            // 테마1번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390, // 가로
                              height: 330,  //세로
                              color: Color(0x99ADD8E6), //배경색
                            ),

                            // 테마1번 기본 플레이 타임 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 180, // 가로
                              height: 140,  // 세로
                              color: Color(0x99778899), // 배경색
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                // 플레이타임 Text부분 Container
                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold // 글씨 두껍게
                                    ),
                                    textAlign: TextAlign.center,  // 글자 가운데 맞춤
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 기본 플레이 타임 배경 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180, // 가로
                              height: 140,  // 세로
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                // 1번 기본 플레이 타임 시간 Container
                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 플레이 인원 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 인원수 배경 Contaier
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),

                                // 인원수 숫자 부분 Container
                                child: Container(
                                  child: Text('$_counter1명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899), // 버튼 배경색

                                // + 버튼
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter1();
                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마1번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899), //버튼

                                // '-' 버튼
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter1();
                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마1번 변동 시간 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 220, // 가로
                              height: 160,  // 세로
                              color: Color(0x99778899), // 배경색
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                // 변동 시간 Text Container
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20, // 글씨 사이즈
                                        fontWeight: FontWeight.bold // 글씨 두껍게
                                    ),
                                    textAlign: TextAlign.center,  // 글씨 가운데 맞춤
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 시간 표시 배경 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                // 테마1번 시간 표시 Text Container
                                child: Container(
                                  child: Text(
                                    '$_TimeCount1:00',
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 시간 1분 증가 배경 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,

                                // '+1' 버튼
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime1();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마1번 시간 1분 감소 배경 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,

                                // '-1' 버튼
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime1();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마1번 시간 10분 증가 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,

                                // '+10' 버튼
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime1();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마 1번 시간 10분 감소 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,

                                // '-10' 버튼
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime1();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마 1번 초기화 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 230, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),

                                // 초기화 버튼
                                child: InkWell(
                                  onTap: (){
                                    _delall1();
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            // 테마1번 튜토리얼 Container
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 290, 0, 0),
                                width: 130,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),

                                // 튜토리얼 버튼
                                child: InkWell(
                                  onTap: () async {

                                    if(_counter1 == 0){  // 인원 수가 0명일때
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog( // 경고창 띄우기
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){  // 경고창 확인버튼
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          ));
                                    }
                                    else{
                                      Navigator.push(context,  // 테마1번 튜토리얼 페이지로 _counter1 값 넘기기
                                          MaterialPageRoute(builder: (context) => ThemeTuto1(PlayTime: baseTime + _TimeCount1),
                                          )
                                      );

                                    }

                                  },
                                  child: const Column(  // 버튼 글씨
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),

                      // 테마2번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390,
                              height: 30,
                              child: Text(
                                "2",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 테마2번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390,
                              height: 330,
                              color: Color(skyblue),
                            ),

                            // 테마2번 플레이 타임 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 185,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 기본 플레이 타임 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마2번 인원수 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마2번 인원수 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(
                                  child: Text('$_counter2명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter2();

                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마2번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter2();

                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마2번 변동시간 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 220,
                              height: 160,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    '$_TimeCount2:00',
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 시간 1분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime2();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 시간 1분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime2();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 시간 10분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime2();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마2번 시간 10분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime2();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마2번 초기화 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 230, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: (){
                                    _delall2();
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // 테마2번 튜토리얼 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 290, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if(_counter2 == 0){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          )
                                      );
                                    }
                                    else{
                                      Navigator.push( context,
                                        MaterialPageRoute(builder: (context) => ThemeTuto2(PlayTime: baseTime + _TimeCount2),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // 테마3번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390,
                              height: 30,
                              child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 테마3번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390,
                              height: 330,
                              color: Color(0x99ADD8E6),
                            ),

                            // 테마3번 플레이 타임 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 185,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 기본 플레이 타임 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마3번 인원수 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마3번 인원수 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(
                                  child: Text('$_counter3명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter3();

                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마3번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter3();

                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마3번 변동시간 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 220,
                              height: 160,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    '$_TimeCount3:00',
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 시간 1분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime3();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 시간 1분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime3();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 시간 10분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime3();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마3번 시간 10분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime3();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마3번 초기화 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 230, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: (){
                                    _delall3();
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // 테마3번 튜토리얼 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 290, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if(_counter3 == 0){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          )
                                      );
                                    }
                                    else{
                                      Navigator.push( context,
                                        MaterialPageRoute(builder: (context) => ThemeTuto3(PlayTime: baseTime + _TimeCount3),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),


                      // 테마4번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390,
                              height: 30,
                              child: Text(
                                "4",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 테마4번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390,
                              height: 330,
                              color: Color(0x99ADD8E6),
                            ),


                            // 테마4번 기본 플레이 타임 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 185,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 플레이 인원수 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 인원수 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(
                                  child: Text('$_counter4명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter4();

                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마4번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter4();

                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마4번 변동 시간 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 230,
                              height: 160,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    '$_TimeCount4:00',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 시간 1분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(130, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime4();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마4번 시간 1분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(190, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime4();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마4번 시간 10분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(130, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime4();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마4번 시간 10분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(190, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime4();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마4번 초기화 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(265, 230, 0, 0),
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () => (
                                      _delall4()
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ),
                            ),

                            // 테마4번 튜토리얼 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(265, 290, 0, 0),
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if(_counter4 == 0){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          )
                                      );
                                    }
                                    else{
                                      Navigator.push( context,
                                        MaterialPageRoute(builder: (context) => ThemeTuto4(PlayTime: baseTime + _TimeCount4),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // 테마5번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390,
                              height: 30,
                              child: Text(
                                "5",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 테마5번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390,
                              height: 330,
                              color: Color(0x99ADD8E6),
                            ),

                            // 테마5번 기본 플레이 타임 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 185,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 플레이 타임 Text Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 플레이 인원수 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 인원수 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(
                                  child: Text('$_counter5명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter5();

                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마5번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter5();

                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마5번 변동 시간 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 220,
                              height: 160,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마5번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    '$_TimeCount5:00',
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 시간 1분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime5();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마5번 시간 1분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime5();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마5번 시간 10분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime5();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마5번 시간 10분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime5();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마5번 초기화 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 230, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () => (
                                      _delall5()

                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ),
                            ),

                            // 테마5번 튜토리얼 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 290, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if(_counter5 == 0){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          )
                                      );
                                    }
                                    else{
                                      Navigator.push( context,
                                        MaterialPageRoute(builder: (context) => ThemeTuto5(PlayTime: baseTime + _TimeCount5),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),


                      // 테마6번
                      Container(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                              width: 390,
                              height: 30,
                              child: Text(
                                "6",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 테마6번 전체 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                              width: 390,
                              height: 330,
                              color: Color(0x99ADD8E6),
                            ),

                            // 테마6번 기본 플레이 타임 container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                              width: 185,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "기본 플레이 타임",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            //테마6번 플레이 타임 Text Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "60:00",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            //테마6번 플레이 인원수 Container
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 50, 0, 0),
                              width: 180,
                              height: 140,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "플레이 인원수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            //테마6번 인원수 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(210, 85, 0, 0),
                              width: 180,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Container(
                                  child: Text('$_counter6명',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마6번 인원수 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(230, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _incrementCounter6();

                                  },
                                  child: Icon(Icons.add, size: 40),
                                ),
                              ),
                            ),

                            // 테마6번 인원수 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(330, 110, 0, 0),
                                color: Color(0x99778899),
                                child: InkWell(
                                  onTap: (){
                                    _decrementCounter6();

                                  },
                                  child: Icon(Icons.remove, size: 40),
                                ),
                              ),
                            ),

                            // 테마6번 변동 시간
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 200, 0, 0),
                              width: 220,
                              height: 160,
                              color: Color(0x99778899),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    "변동 시간",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마6번 시간 표시
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 260, 0, 0),
                              width: 140,
                              height: 140,

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  child: Text(
                                    '$_TimeCount6:00',
                                    style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마6번 시간 1분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTime6();
                                  },
                                  child: Text('+1', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마6번 시간 1분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 250, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTime6();
                                  },
                                  child: Text('-1', style:
                                  TextStyle(
                                      fontSize: 30
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // 테마6번 시간 10분 증가
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(120, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _incrementTenTime6();
                                  },
                                  child: Text('+10', style:
                                  TextStyle(
                                    fontSize: 28,
                                    //fontWeight: FontWeight.bold
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마6번 시간 10분 감소
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(180, 300, 0, 0),
                                color: Color(0x99778899),
                                width: 50,
                                height: 40,
                                child: InkWell(
                                  onTap: (){
                                    _decrementTenTime6();
                                  },
                                  child: Text('-10', style:
                                  TextStyle(
                                      fontSize: 28
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),


                            // 테마6번 초기화 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 230, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () => (
                                      _delall6()

                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "초기화",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ),
                            ),

                            // 테마6번 튜토리얼 버튼
                            Container(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(255, 290, 0, 0),
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.black54,  // 버튼 색 지정
                                    borderRadius: BorderRadius.circular(20) // 버튼 동그랗게
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if(_counter6 == 0){
                                      showDialog(context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(''),
                                            content: Text('인원수를 입력해주세요!',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),textAlign: TextAlign.center,),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, child: const Text('확인'))
                                            ],
                                          )
                                      );
                                    }
                                    else{
                                      Navigator.push( context,
                                        MaterialPageRoute(builder: (context) => ThemeTuto6(PlayTime: baseTime + _TimeCount6),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "튜토리얼",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            )

                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )


    );
  }


  // 테마1번 인원수 조정
  void _incrementCounter1(){
    setState((){
      if(_counter1 < 5){
        _counter1++;
      }
    });
  }

  void _decrementCounter1(){
    setState((){
      if(_counter1 > 0){
        _counter1--;
      }

    });
  }

  //테마1번 시간 조정
  // +1분
  void _incrementTime1(){
    setState((){
      _TimeCount1++;
    });
  }

  //-1분
  void _decrementTime1(){
    setState((){

      _TimeCount1--;

    });
  }

  // +10분
  void _incrementTenTime1(){
    setState((){
      _TimeCount1+=10;
    });
  }

  // -10분
  void _decrementTenTime1(){
    setState((){

      _TimeCount1-=10;

    });
  }

  //테마1번 초기화
  void _delall1(){
    setState(() {
      _TimeCount1 = 0;
      _counter1 = 0;
    });
  }


  //테마2번 인원 수 조정
  void _incrementCounter2(){
    setState((){
      if(_counter2 < 5){
        _counter2++;
      }
    });
  }

  void _decrementCounter2(){
    setState((){
      if(_counter2 > 0){
        _counter2--;
      }

    });
  }

//테마2번 시간 조정
// +1분
  void _incrementTime2(){
    setState((){
      _TimeCount2++;
    });
  }

//-1분
  void _decrementTime2(){
    setState((){

      _TimeCount2--;

    });
  }

// +10분
  void _incrementTenTime2(){
    setState((){
      _TimeCount2+=10;
    });
  }

// -10분
  void _decrementTenTime2(){
    setState((){

      _TimeCount2-=10;

    });
  }
  //테마2번 초기화
  void _delall2(){
    setState(() {
      _TimeCount2 = 0;
      _counter2 = 0;
    });
  }


//테마3번 인원 수 조정
  void _incrementCounter3(){
    setState((){
      if(_counter3 < 5){
        _counter3++;
      }
    });
  }

  void _decrementCounter3(){
    setState((){
      if(_counter3 > 0){
        _counter3--;
      }

    });
  }
//테마3번 시간 조정
// +1분
  void _incrementTime3(){
    setState((){
      _TimeCount3++;
    });
  }

//-1분
  void _decrementTime3(){
    setState((){

      _TimeCount3--;

    });
  }

// +10분
  void _incrementTenTime3(){
    setState((){
      _TimeCount3+=10;
    });
  }

// -10분
  void _decrementTenTime3(){
    setState((){

      _TimeCount3-=10;

    });
  }
  //테마3번 초기화
  void _delall3(){
    setState(() {
      _TimeCount3 = 0;
      _counter3 = 0;
    });
  }



//테마4번 인원 수 조정
  void _incrementCounter4(){
    setState((){
      if(_counter4 < 5){
        _counter4++;
      }
    });
  }

  void _decrementCounter4(){
    setState((){
      if(_counter4 > 0){
        _counter4--;
      }

    });
  }
//테마4번 시간 조정
// +1분
  void _incrementTime4(){
    setState((){
      _TimeCount4++;
    });
  }

//-1분
  void _decrementTime4(){
    setState((){

      _TimeCount4--;

    });
  }

// +10분
  void _incrementTenTime4(){
    setState((){
      _TimeCount4+=10;
    });
  }

// -10분
  void _decrementTenTime4(){
    if(_TimeCount4 > -51){
      setState((){
        _TimeCount4-=10;
      });
    }
  }
  //테마4번 초기화
  void _delall4(){
    setState(() {
      _TimeCount4 = 0;
      _counter4 = 0;
    });
  }



//테마5번 인원 수 조정
  void _incrementCounter5(){
    setState((){
      if(_counter5 < 5){
        _counter5++;
      }
    });
  }

  void _decrementCounter5(){
    setState((){
      if(_counter5 > 0){
        _counter5--;
      }

    });
  }

//테마5번 시간 조정
// +1분
  void _incrementTime5(){
    setState((){
      _TimeCount5++;
    });
  }

//-1분
  void _decrementTime5(){
    if(_TimeCount5 > -60){
      setState((){
        _TimeCount5--;
      });
    }
  }

// +10분
  void _incrementTenTime5(){
    setState((){
      _TimeCount5+=10;
    });
  }

// -10분
  void _decrementTenTime5(){
    if(_TimeCount5 > -51){
      setState((){
        _TimeCount5-=10;
      });
    }
  }
  //테마5번 초기화
  void _delall5(){
    setState(() {
      _TimeCount5 = 0;
      _counter5 = 0;
    });
  }



//테마6번 인원 수 조정
  void _incrementCounter6(){
    setState((){
      if(_counter6 < 5){
        _counter6++;
      }
    });
  }

  void _decrementCounter6(){
    setState((){
      if(_counter6 > 0){
        _counter6--;
      }

    });
  }

//테마6번 시간 조정
// +1분
  void _incrementTime6(){
    setState((){
      _TimeCount6++;
    });
  }

//-1분
  void _decrementTime6(){
    if(_TimeCount6 > -60){
      setState((){
        _TimeCount6--;
      });
    }
  }

// +10분
  void _incrementTenTime6(){
    setState((){
      _TimeCount6+=10;
    });
  }

// -10분
  void _decrementTenTime6(){
    if(_TimeCount6 > -51){
      setState((){
        _TimeCount6-=10;
      });
    }
  }

  //테마6번 초기화
  void _delall6(){
    setState(() {
      _TimeCount6 = 0;
      _counter6 = 0;
    });
  }
}