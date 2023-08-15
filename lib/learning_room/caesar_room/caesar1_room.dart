import 'package:cryptography/youtube/video_player.dart';
import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';
import 'package:cryptography/learning_room/caesar_room/test1_room.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CaesarRoom1 extends StatefulWidget {
  const CaesarRoom1({super.key});

  @override
  State<CaesarRoom1> createState() => _CaesarRoom1State();
}

class _CaesarRoom1State extends State<CaesarRoom1> {
  @override
  YoutubePlayerController? _controller;

  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'LVza-R_r7P0',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  final List<String> messages = [
    ' 歡迎來到凱薩密碼介紹！凱薩密碼是一種古老且簡單的加密技術，'
        '它通過將字母按照固定的位移量向左或向右移動來加密消息。'
        '該算法得名於古羅馬軍事指揮官凱薩，他用它來保護重要的通訊。'
        '了解凱薩密碼的加密和解密方法，讓我們一同探索這有趣的密碼學世界吧！',
    '凱薩密碼有三個要點：\n\n1. 要加密的文字\n2. 金鑰\n3. 密文\n\n(在這裡都是用英文字母喔!)',
    '先來說明要加密的文字，這是你想傳給別人的文字，'
        '舉例來說<i love you>這個明文經過金鑰為 1 加密後會為\n密文<j mpwf zpv>\n'
        '就是把英文字母都往後一個來顯示',
    '上面的圖的外圈是固定的，內圈可以轉動，內圈裡的數字就是金鑰，'
        '只要轉動內圈，再把想傳送的字串從外圈往內一個一個搜尋對應的字母，'
        '就可以拼出新的字串，這就是加密後的密文!\n\n'
        '既然了解完畢就來練習一下吧!',
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
          title: Text('凱薩密碼', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1, //messages.length,
            itemBuilder: (context, index) => Container(
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
                        child: VideoPlayerView(
                          url: 'assets/caesar_cipher.mp4',
                          dataSourceType: DataSourceType.asset,
                        ),
                        /*
                        YoutubePlayerBuilder(
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

                         */
                      ),

                      // -->  Second part of message
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child:
                            Text(messages[1], style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child:
                            Text(messages[2], style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child: Image.asset('assets/caesar_cipher.png'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        child:
                            Text(messages[3], style: TextStyle(fontSize: 20)),
                      ),
                      ElevatedButton(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CaesarTestRoom()));
                        },
                      ),
                    ],
                  ),
                )));
  }
}
