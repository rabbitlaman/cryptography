import 'package:cryptography/learning_room/caesar_room/caesar1_room.dart';
import 'package:cryptography/learning_room/playfair_room/playfair1_room.dart';
import 'package:flutter/material.dart';
import '../about.dart';
import 'keyword_room/keyword1_room.dart';
import 'rail_fence_room/rail_fence1_room.dart';
import 'vigenere_room/vigenere1_room.dart';

final ciphers = [
  '凱薩密碼教程',
  '關鍵字密碼教程',
  '波雷費密碼教程',
  '籬笆密碼教程',
  '維吉尼亞密碼教程',
];


class LearnInChangeRoom extends StatelessWidget {
  const LearnInChangeRoom({super.key});

  @override
  Widget build(BuildContext context) {

    void _ForwardPage(int index) {
      if(index == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CaesarRoom1()));
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => About()));
              })
        ],
        title: Text('學習區', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body:
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
                leading: Icon(Icons.check_box_outline_blank, color: Colors.black),
                title: Text(ciphers[index]),
              ),
            );
          }),
    );
  }
}
