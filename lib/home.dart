import 'package:cryptography/video.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'screen.dart';
import 'learning_room/caesar_room/caesar1_room.dart';
import 'learning_room/keyword_room/keyword1_room.dart';
import 'learning_room/rail_fence_room/rail_fence1_room.dart';
import 'learning_room/vigenere_room/vigenere1_room.dart';
import 'learning_room/playfair_room/playfair1_room.dart';
import 'learning_room/caesar_room/test2_seperate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final ciphers = [
    '凱薩密碼',
    '關鍵字密碼',
    '波雷費密碼',
    '籬笆密碼',
    '維吉尼亞密碼',
  ];

  final ciphers1 = [
    '凱薩密碼教程',
    '關鍵字密碼教程',
    '波雷費密碼教程',
    '籬笆密碼教程',
    '維吉尼亞密碼教程',
  ];
  final List<String> videoItems = [
    '密碼學經典歷史',
    '密碼學應用',
    'AES',
    '量子密碼',
  ];

  void _ForwardPage(int index) {
    if (index == 0) {
      Navigator.push(
          //context, MaterialPageRoute(builder: (context) => CaesarRoom1()));
          context, MaterialPageRoute(builder: (context) => SeperateTestRoom()));
    }
    if(index == 1){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => KeyWordRoom1()));
    }
    if(index == 2){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayFairRoom()));
    }
    if(index == 3){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RailFenceRoom()));
    }
    if(index == 4){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VigenerreRoom()));
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
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              })
        ],
        title: Text('密碼學', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
     /*
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //設定用户名稱
            UserAccountsDrawerHeader(
              accountName: new Text(
                "成為密碼大師之路",
              ),
              //設定Email
              accountEmail: new Text(
                "thiscryptography@gmail.com",
              ),
              //設定大頭照
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('assets/Anonymous_Mask.png'),
              ),
            ),
            //選單
            ListTile(
              leading: new CircleAvatar(
                  child:
                      Icon(Icons.build_rounded, color: Colors.black, size: 45),
                  backgroundColor: Colors.white),
              title: Text('工具區'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Tool()));
              },
            ),
            ListTile(
              leading: new CircleAvatar(
                  child: Icon(Icons.code_sharp, color: Colors.black, size: 45),
                  backgroundColor: Colors.white),
              title: Text('學習區'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LearnInChangeRoom()));
              },
            ),
            ListTile(
              leading: new CircleAvatar(
                  child: Icon(Icons.smart_display_outlined,
                      color: Colors.black, size: 45),
                  backgroundColor: Colors.white),
              title: Text('影片'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VideoForLearn()));
              },
            ),
          ],
        ),
      ),
      */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            color: Colors.transparent,
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(icon: Icon(Icons.build_rounded), text: '工具區'),
                  Tab(icon: Icon(Icons.code_sharp), text: '學習區'),
                  Tab(icon: Icon(Icons.smart_display_outlined), text: '影片區'),
                ]),
          ),
          Container(
            width: double.maxFinite,
            height: 500,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    itemCount: ciphers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Screen(title: ciphers[index])));
                          },
                          leading: Icon(Icons.lock, color: Colors.black),
                          title: Text(ciphers[index]),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: ciphers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015,
                          right: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: ListTile(
                          onTap: () {
                            _ForwardPage(index);
                          },
                          leading: Icon(Icons.check_box_outline_blank,
                              color: Colors.black),
                          title: Text(ciphers1[index]),
                        ),
                      );
                    }),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: videoItems.length,
                    itemBuilder: (context, index) {
                      return VideoItemCard(videoTitle: videoItems[index], indexn: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
