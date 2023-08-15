import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

final List<String> messages = [
  ' 金鑰為\'3\'\n想加密的的文字是\n\'i want to say you are the best\'\n'
      '請問經過凱薩加密後的密文會長甚麼樣子?',
  '接下來是要從密文反推原本的文字\n金鑰是6\n這是已經加密過的字串\n\"ixevzumxgvne\"\n'
      '請幫忙解出一個英文單字，要有意義的喔!',
];

class CaesarTestRoom extends StatefulWidget {
  const CaesarTestRoom({super.key});
  @override
  State<CaesarTestRoom> createState() => _CaesarTestRoomState();
}

class _CaesarTestRoomState extends State<CaesarTestRoom> {
  @override
  bool check1 = false,
      check2 = false,
      check3 = false,
      check4 = false,
      check5 = false;

  final TextEditingController myController_1 = new TextEditingController(),
      myController_2 = new TextEditingController();
  String answer = 'l zdqw wr vdb brx duh wkh ehvw',
      answer1 = 'cryptography',
      congratu = '';

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
          '凱薩密碼測驗區',
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
                    if (myController_1.text == answer) {
                      _congratulations(0);
                    }
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
                              builder: (context) => Home()));
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
