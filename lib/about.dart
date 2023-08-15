import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("關於", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('assets/logo.png',
          height: MediaQuery.of(context).orientation == Orientation.portrait 
          ? MediaQuery.of(context).size.height * 0.20 
          : MediaQuery.of(context).size.width * 0.25
          ,
          width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.20
          : MediaQuery.of(context).size.width * 0.25
          ,),
          SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait 
           ?  MediaQuery.of(context).size.height * 0.10
           : MediaQuery.of(context).size.width * 0.15,
            child: Center(
              child: Text(
                '密碼學 v1.0',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.03 : MediaQuery.of(context).size.width * 0.05),
              ),
            ),
          ),
          Image.asset(
            'assets/github.png',
            height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.20
            : MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.20
            : MediaQuery.of(context).size.width * 0.25,
          ),
          SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait 
            ? MediaQuery.of(context).size.height * 0.07
            : MediaQuery.of(context).size.width * 0.10,
            child: Center(
              child: Text(
                'GitHub Repository',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.03 : MediaQuery.of(context).size.width * 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              '這個Github 儲存庫是讓你初入學習密碼學的軟體，想了解程式碼，請點擊下面的按鈕，即可看到程式碼。\n'
                  '如果可以也可以把回饋寫email給我們，我們會給您有更好的體驗',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.0225 : MediaQuery.of(context).size.width * 0.03),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color
                    onPrimary: Colors.black,
                  ),
                  child: Text('REPOSITORY'),
                  onPressed: () {
                    launch(
                      'https://github.com/rabbitlaman/cryptography',
                      enableJavaScript: true,
                      forceWebView: false,
                      forceSafariVC: false
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
