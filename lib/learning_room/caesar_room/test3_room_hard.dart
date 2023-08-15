import 'package:cryptography/home.dart';
import 'package:flutter/material.dart';

final List<String> messages = [
  '請把這段字串解密：\n\n'
      'cqrbfxamrbbxknjdcrodurfjwccxjlqrnenvhmanjvrwvhuron',
];

class CaesarTestRoom_hard extends StatefulWidget {
  const CaesarTestRoom_hard({super.key});

  @override
  State<CaesarTestRoom_hard> createState() => _CaesarTestRoom_hardState();
}

class _CaesarTestRoom_hardState extends State<CaesarTestRoom_hard> {
  @override
  bool check1 = false,
      check2 = false,
      check3 = false,
      check4 = false,
      check5 = false;

  final TextEditingController myController_1 = new TextEditingController(),
      myController_2 = new TextEditingController();
  String answer = 'thiswordissobeautifuliwanttoachievemydreaminmylife',
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
                    hintText: '請輸入計算出的明文...',
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
                    if (myController_1.text == answer)
                      _congratulations(0);


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
              ///////////////////////////////////////////////////////////下一題
              Visibility(
                visible: check2,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    color: Colors.cyan,
                    child: const Text(
                      'Finish',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
