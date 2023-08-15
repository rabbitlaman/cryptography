import 'package:cryptography/learning_room/learning_room.dart';
import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

final List<String> messages = [
  '深度為2的籬笆密碼，其明文字串是\nwinthisgame\n'
      '請用前面教學的方式把圖畫出來列出加密後的文字，'
      '把密文輸入再以下輸入格!',
  '深度為2的籬笆密碼，其加密後字串是\ntigmigethsaesra\n'
      '請把加密後的字串解密出有意義的明文字串，運用前面所提的方式逆向操作，'
      '將解出來的字串輸入至下面!',
];



class RailFenceTest1 extends StatefulWidget {
  const RailFenceTest1({super.key});

  @override
  State<RailFenceTest1> createState() => _RailFenceTest1State();
}

class _RailFenceTest1State extends State<RailFenceTest1> {
  @override
  bool check1 = false,
      check2 = false,
      check3 = false,
      check4 = false,
      check5 = false;

  final TextEditingController myController_1 = new TextEditingController(),
      myController_2 = new TextEditingController();
  String answer = 'wnhsaeitigm', answer1 = 'thisgameisgreat', congratu = '';

  void _congratulations(int checknum) {
    if (checknum == 0) {
      congratu = '恭喜答對';
      check1 = true;
      check2 = true;
    }
    if (checknum == 1) {
      congratu = '請再繼續嘗試!';
      check1 = true;
    }
  }

  void _congratulations1(int checknum) {
    if (checknum == 0) {
      congratu = '恭喜答對';
      check4 = true;
      check5 = true;
    }
    if (checknum == 1) {
      congratu = '請再繼續嘗試!';
      check4 = true;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '籬笆密碼測驗區',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.house_outlined),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              })
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    minWidth: 0, maxWidth: 370, minHeight: 0, maxHeight: 250),
                decoration: BoxDecoration(
                  color: Colors.cyan[100], // 容器的背景颜色
                  borderRadius: BorderRadius.circular(10), // 圆角
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                      blurRadius: 5, // 阴影的模糊范围
                      offset: Offset(0, 3), // 阴影的偏移量
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.lightBlue], // 渐变颜色
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Text(messages[0], style: TextStyle(fontSize: 20)),
              ),
              Container(
                constraints: BoxConstraints(
                    minWidth: 0, maxWidth: 370, minHeight: 0, maxHeight: 250),
                decoration: BoxDecoration(
                  color: Colors.cyan[100], // 容器的背景颜色
                  borderRadius: BorderRadius.circular(10), // 圆角
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                      blurRadius: 5, // 阴影的模糊范围
                      offset: Offset(0, 3), // 阴影的偏移量
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.lightBlue], // 渐变颜色
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: TextField(
                  controller: myController_1,
                  decoration: InputDecoration(
                    hintText: '請輸入計算出的密文...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        myController_1.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (myController_1.text == answer) _congratulations(0);

                    if (myController_1.text != answer) _congratulations(1);
                  });
                },
                color: Colors.cyan,
                child: const Text(
                  '送出',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Visibility(
                visible: check1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan[100], // 容器的背景颜色
                    borderRadius: BorderRadius.circular(10), // 圆角
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                        blurRadius: 5, // 阴影的模糊范围
                        offset: Offset(0, 3), // 阴影的偏移量
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.tealAccent, Colors.lightBlue], // 渐变颜色
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                    congratu,
                    style: TextStyle(color: Colors.limeAccent, fontSize: 55),
                  ),
                ),
              ),
              Visibility(
                visible: check2,
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        check3 = true;
                      });
                    },
                    color: Colors.cyan,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    )),
              ),

              ///////////////////////////////////////////////////////////下一題
              Visibility(
                  visible: check3,
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 370,
                            minHeight: 0,
                            maxHeight: 250),
                        decoration: BoxDecoration(
                          color: Colors.cyan[100], // 容器的背景颜色
                          borderRadius: BorderRadius.circular(10), // 圆角
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // 阴影颜色和透明度
                              blurRadius: 5,
                              // 阴影的模糊范围
                              offset: Offset(0, 3), // 阴影的偏移量
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [Colors.tealAccent, Colors.lightBlue],
                            // 渐变颜色
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child:
                        Text(messages[1], style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 370,
                            minHeight: 0,
                            maxHeight: 250),
                        decoration: BoxDecoration(
                          color: Colors.cyan[100], // 容器的背景颜色
                          borderRadius: BorderRadius.circular(10), // 圆角
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // 阴影颜色和透明度
                              blurRadius: 5,
                              // 阴影的模糊范围
                              offset: Offset(0, 3), // 阴影的偏移量
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [Colors.tealAccent, Colors.lightBlue],
                            // 渐变颜色
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: TextField(
                          controller: myController_2,
                          decoration: InputDecoration(
                            hintText: '請輸入計算出的密文...',
                            suffixIcon: IconButton(
                              onPressed: () {
                                myController_2.clear();
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (myController_2.text == answer1) {
                              _congratulations1(0);
                            }
                            if (myController_2.text != answer1)
                              _congratulations1(1);
                          });
                        },
                        color: Colors.cyan,
                        child: const Text(
                          '送出',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )),
              Visibility(
                visible: check4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan[100], // 容器的背景颜色
                    borderRadius: BorderRadius.circular(10), // 圆角
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                        blurRadius: 5, // 阴影的模糊范围
                        offset: Offset(0, 3), // 阴影的偏移量
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.tealAccent, Colors.lightBlue], // 渐变颜色
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text(
                    congratu,
                    style: TextStyle(color: Colors.limeAccent, fontSize: 55),
                  ),
                ),
              ),
              Visibility(
                visible: check5,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnInChangeRoom()));
                    },
                    color: Colors.cyan,
                    child: const Text(
                      'Finish',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
