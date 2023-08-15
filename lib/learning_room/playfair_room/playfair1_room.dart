import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

class PlayFairRoom extends StatefulWidget {
  const PlayFairRoom({super.key});

  @override
  State<PlayFairRoom> createState() => _PlayFairRoomState();
}

class _PlayFairRoomState extends State<PlayFairRoom> {
  @override

  final List<String> messages = [
    '波雷費密碼是一種基於二維方陣的替換式加密法，將明文中的字母配對，根據特定規則轉換為密文。'
        '這種加密技術在歷史上廣泛用於保護機密通訊。'
        '讓我們一同探索這有趣的密碼學世界吧！',
  '1.設定金鑰矩陣：訂關鍵字組成5 × 5的金鑰矩陣\n'
  '• 金鑰矩陣的建構方式:\n'
  '– 將關鍵字由左至右和由上至下填入，並刪除重複字元\n'
  '– 將26個字母剩餘的字元依序填入，而且將I跟J視為同一個字元\n',

  '執行規則：'
  '1.每次皆針對明文中的雙字元來進行加密:'
  '– 若雙字元是相同字元就插入填充字元如X'

  '2.– 若雙字元位於矩陣同一列，就把第一個字元當成最後一個字元的右邊字元(即旋轉)，'
  '並用它們右邊的字元來取代，如”WN”取代為”NT”'

  '3.– 若雙字元位於矩陣同一行，就把第一個字元當'
  '成是最後一個字元的下方字元(即旋轉) ，並且'
  '用它們下方的字元來取代，如”OU”取代為”UT”'

  '4.– 否則(即兩字不同行又不同列)，則每個字元都'
  '取代與它同一列、但與另一個字元同一行的字元，如”HS”取代為”MP”而”EA”取代成”CW”',
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
          title: Text('波雷費密碼', style: TextStyle(color: Colors.black)),
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
                          child: Image.asset('assets/playfair_cipher.png'),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                         Home()));
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
