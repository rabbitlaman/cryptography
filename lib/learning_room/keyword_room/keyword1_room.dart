import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';
import 'package:cryptography/learning_room/keyword_room/test1_room.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class KeyWordRoom1 extends StatefulWidget {
  const KeyWordRoom1({super.key});

  @override
  State<KeyWordRoom1> createState() => _KeyWordRoom1State();
}

class _KeyWordRoom1State extends State<KeyWordRoom1> {
  @override
  YoutubePlayerController? _controller;

  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'XreUs1I1ZdY',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

  final List<String> messages = [
    '關鍵字密碼是一種替換式加密方法，使用關鍵字來加密和解密消息。'
        '通過將字母映射到關鍵字中的對應字母，可以創建一個獨特的密鑰。'
        '這種加密技術可以保護機密信息免受未授權的查看。'
        '讓我們一同探索這有趣的密碼學世界吧！',
    '關鍵字密碼有四個要點：\n\n1. 要加密的文字\n2. 關鍵字\n3. 密碼表\n4. 密文\n\n(在這裡都是用英文字母喔!)',
    '選擇一個單字後，再組成字母表，先將單字排入再將剩下沒重複的字母一序排入\n例如：單字：activity\n密碼表：\n',
    'A變成S  B變成E  C變成C因此類推，\n這裡要提醒一下，關鍵字在排入表格時要移除自身有重複的字母，每個字母只出現一次，'
        '這裡舉例：activity --> activy',
    '之後加密與解密都要利用這個表格，利用組好的字母表將明文轉換成密文\n要解密時再將密文轉換成明文\n\n'
        '例如：明文：Zombie Here\n密文：ZLJCEV DVOV',
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
          title: Text('關鍵字密碼', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1, //messages.length,
            itemBuilder: (context, index) =>
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child:
                        Text(messages[0], style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _controller!,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                          ),
                          builder: (context, player) {
                            return Container(child: player);
                          },
                        ),
                      ),
                      // -->  Second part of message
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child: Text(messages[1],
                            style: TextStyle(fontSize: 20)),
                      ),
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
                        child: Image.asset('assets/keyword_cipher.png'),
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
                        child: Text(messages[4],
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child: Text(messages[5],
                            style: TextStyle(fontSize: 20)),
                      ),
                      ElevatedButton(
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
                                      KeyWordTest1()));
                        },
                      ),
                    ],
                  ),
                )
        )
    );
  }
}
