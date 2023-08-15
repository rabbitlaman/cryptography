import 'package:cryptography/learning_room/vigenere_room/test1_room.dart';
import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

class VigenerreRoom extends StatefulWidget {
  const VigenerreRoom({super.key});

  @override
  State<VigenerreRoom> createState() => _VigenerreRoomState();
}

class _VigenerreRoomState extends State<VigenerreRoom> {
  @override
  final List<String> messages = [
    '維吉尼亞密碼是一種多表替換式加密法，使用關鍵字作為密鑰，將明文中的字母與關鍵字進行組合來加密消息。'
        '這種加密技術提供較高的安全性和可讀性，適用於保護敏感資訊。'
        '讓我們一同探索這有趣的密碼學世界吧！',
    '維吉尼亞密碼有四個要點：\n\n1. 要加密的文字\n2.查表 \n3. 關鍵字\n4. 加密後的密文\n\n'
        '(在這裡都是用英文字母喔!)',
    '我們來舉例\n明文：attackatdawn\n關鍵字：lemon\n接下來要把關鍵字長度拉滿跟明文一樣，'
        '這時再去下圖的表格查表就可以得出密文了',
    '造出的密文：LXFOPVEFRNHR\n下面的圖可以更好了解維吉尼亞密碼的運作原理!',
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
          title: Text('維吉尼亞密碼', style: TextStyle(color: Colors.black)),
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
                          child: Image.asset('assets/vigenere_cipher.png'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          color: Colors.transparent,
                          child: Text(messages[3],
                              style: TextStyle(fontSize: 20)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          color: Colors.transparent,
                          child: Image.asset('assets/vigenere1_cipher.png'),
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
                                          VigenereTest1()));
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
