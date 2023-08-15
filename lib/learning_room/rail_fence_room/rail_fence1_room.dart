import 'package:cryptography/learning_room/rail_fence_room/test1_room.dart';
import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

class RailFenceRoom extends StatefulWidget {
  const RailFenceRoom({super.key});

  @override
  State<RailFenceRoom> createState() => _RailFenceRoomState();
}

class _RailFenceRoomState extends State<RailFenceRoom> {
  @override
  final List<String> messages = [
    '籬笆密碼是一種簡單的替換式加密方法，將字母按照特定規則分成幾行，再按行讀取形成加密文本。'
        '這種加密方式適用於快速加密和解密短消息，但對於長消息效率較低。'
        '這種加密技術可以保護機密信息免受未授權的查看。'
        '讓我們一同探索這有趣的密碼學世界吧！',
    '籬笆密碼有三個要點：\n\n1. 要加密的文字\n2.畫圖 \n3. 加密後的密文\n\n(在這裡都是用英文字母喔!)',
    '要加密的明文：nesoacademylsthebest\n將明文寫成一連串的深度為2欄對角形式柵欄，然後列出，像以下這樣',
    '再把列出後的表格從第一列開始抓字母，再來是第二列，都抓完後就有加密後的字串了\n加密後的密文：nsaaeyshbseocdmlteet',
    '既然了解了關鍵字密碼的流程，我們來做幾個小測驗吧~',

  ];

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;

  void _changevisibleBOOL(String tmpcheck) {
    switch (tmpcheck) {
      case 'check1':
        check1 = true;
        break;
      case 'check2':
        check2 = true;
        break;
      case 'check3':
        check3 = true;
        break;
      case 'check4':
        check4 = true;
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.house_outlined),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                })
          ],
          title: Text('籬笆密碼', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1, //messages.length,
            itemBuilder: (context, index) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          color: Colors.transparent,
                          child:
                              Text(messages[0], style: TextStyle(fontSize: 20)),
                        ),
                        Positioned(
                          right: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey, // Background color
                              onPrimary: Colors.black,
                              textStyle: TextStyle(fontSize: 20.0),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text('Next'),
                            onPressed: () {
                              setState(() {
                                _changevisibleBOOL('check1');
                              });
                            },
                          ),
                        ),
                      ]),
                      // -->  Second part of message
                      Visibility(
                        visible: check1,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              child: Text(messages[1],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Align(
                              alignment: Alignment(0.8, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey,
                                  // Background color
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(fontSize: 20.0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text('Next'),
                                onPressed: () {
                                  setState(() {
                                    _changevisibleBOOL('check2');
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: check2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              child: Text(messages[2],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              child: Image.asset('assets/rail_fence.png'),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              child: Text(messages[3],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Align(
                              alignment: Alignment(0.8, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey, // Background color
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(fontSize: 20.0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text('Next'),
                                onPressed: () {
                                  setState(() {
                                    _changevisibleBOOL('check3');
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: check3,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              child: Text(messages[4],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Align(
                              alignment: Alignment(0.8, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey, // Background color
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(fontSize: 20.0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text('Next'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RailFenceTest1()));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
