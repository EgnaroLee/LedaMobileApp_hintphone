import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hint_app_7/startpage.dart';

class Theme4HintPage9 extends StatefulWidget {
  const Theme4HintPage9({super.key});

  @override
  State<Theme4HintPage9> createState() => _HintPageState();
}

class _HintPageState extends State<Theme4HintPage9> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    var mediaQuery = MediaQuery.of(context);

    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

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
                          child: Text(
                        "힌트 9번",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                    automaticallyImplyLeading: false // 앱바 상단에 뒤로가기 버튼 삭제
                    ),
              ),
            )),
        body: WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Center(
              child: Expanded(
                  child: Container(
            color: Color(skyblue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(10),
                      child: Expanded(
                        child: Container(),
                      ),
                    ),
                    flex: 9),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(color: Color(darkblue), borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Container(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Container(
                                        child: AutoSizeText(
                                          "뒤로가기",
                                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                              flex: 1),
                          Flexible(
                              child: Container(
                            child: Center(
                              child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(color: Color(darkblue), borderRadius: BorderRadius.circular(20)),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ShowAnswer1();
                                          });
                                    },
                                    child: Center(
                                      child: Container(
                                        child: AutoSizeText(
                                          "정답보기",
                                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          ))),
        ));
  }
}

class ShowAnswer1 extends StatefulWidget {
  const ShowAnswer1({super.key});

  @override
  ShowAnswerState createState() => ShowAnswerState();
}

class ShowAnswerState extends State<ShowAnswer1> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    return Dialog(
      child: Container(
        child: Column(
          children: [
            Flexible(
                child: Container(
                  color: Colors.grey,
                  child: Expanded(
                    child: Container(
                        child: Center(
                      child: Container(
                        child: Image.asset("images/11.png"),
                      ),
                    )),
                  ),
                ),
                flex: 8),
            Flexible(
              child: Container(
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Container(
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(darkblue),
                            ),
                            child: Center(
                              child: Container(
                                child: AutoSizeText(
                                  "닫기",
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
