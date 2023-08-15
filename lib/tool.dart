import 'package:flutter/material.dart';
import 'about.dart';
import 'screen.dart';


final ciphers = [
  '凱薩密碼',
  '關鍵字密碼',
  '波雷費密碼',
  '籬笆密碼',
  '維吉尼亞密碼',
];

class Tool extends StatefulWidget {
  @override
  _ToolState createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  @override

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                })
          ],
          title: Text('密碼工具區', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),

        body: ListView.builder(
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
            })
    );
  }
}
