import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

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
        title: Text('密碼學的世界', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('assets/entrancePage.png',
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.50
                : MediaQuery.of(context).size.width * 0.55
            ,
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.5
                : MediaQuery.of(context).size.width * 0.55
            ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white60, // Background color
                    onPrimary: Colors.black,
                    textStyle: TextStyle(fontSize: 60.0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('開始'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()));
                  },
                ),
              ),
            ],
          ),
        ],
        )
    );
  }
}
