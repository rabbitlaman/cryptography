import 'package:cryptography/learning_room/caesar_room/caesar1_room.dart';
import 'package:cryptography/learning_room/caesar_room/test3_room_hard.dart';
import 'package:flutter/material.dart';
import 'package:cryptography/home.dart';

final List<String> messages = [
  '請你選擇下列題目的選項',
  '你是否知道凱薩密碼?',
  '你是否了解凱薩密碼的原理?',
];
final List<bool> indexfortext = [true, false,];
bool check123 = true;

int visibleChangeFc(bool YorN,bool level){
  if(YorN == true && level == true){
  indexfortext [0] = false;
  indexfortext [1] = true;
  check123 = false;
  return 3;
  }
  else if(YorN == true && level == false){
    indexfortext [0] = true;
    indexfortext [1] = false;
    check123 = true;
      return 1;
  }
  else
    return 0;
}

class SeperateTestRoom extends StatefulWidget {
  const SeperateTestRoom({super.key});

  @override
  State<SeperateTestRoom> createState() => _SeperateTestRoomState();
}

class _SeperateTestRoomState extends State<SeperateTestRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '凱薩密碼前測',
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
        itemBuilder: (context, index) =>
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: 370,
                        minHeight: 0,
                        maxHeight: 250),
                    decoration: BoxDecoration(
                      color: Colors.white54, // 容器的背景颜色
                      borderRadius: BorderRadius.circular(10), // 圆角
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                          blurRadius: 5, // 阴影的模糊范围
                          offset: Offset(0, 3), // 阴影的偏移量
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Text(messages[0], style: TextStyle(fontSize: 20)),
                  ),
                  Visibility(
                      visible: indexfortext[0],
                      child:
                      Container(
                        constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 370,
                            minHeight: 0,
                            maxHeight: 250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // 容器的背景颜色
                          borderRadius: BorderRadius.circular(10), // 圆角
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                              blurRadius: 5, // 阴影的模糊范围
                              offset: Offset(0, 3), // 阴影的偏移量
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Text(
                            messages[1], style: TextStyle(fontSize: 20)),
                      )
                  ),
                  Visibility(
                      visible: indexfortext[1],
                      child:
                      Container(
                        constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 370,
                            minHeight: 0,
                            maxHeight: 250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // 容器的背景颜色
                          borderRadius: BorderRadius.circular(10), // 圆角
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // 阴影颜色和透明度
                              blurRadius: 5, // 阴影的模糊范围
                              offset: Offset(0, 3), // 阴影的偏移量
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Text(
                            messages[2], style: TextStyle(fontSize: 20)),
                      )
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                               int dire = visibleChangeFc(true, check123);
                               if(dire == 1)
                                 Navigator.push(
                                     context, MaterialPageRoute(builder: (context) => CaesarTestRoom_hard()));

                            });
                          },
                          child: Text('是')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                               int dire =visibleChangeFc(false,check123);
                              if(dire == 0)
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => CaesarRoom1()));
                            });
                          },
                          child: Text('否')),
                    ],
                  ),

                ],
              ),
            ),
      ),
    );
  }
}
