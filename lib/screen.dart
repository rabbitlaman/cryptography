import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic.dart';

Logic logic = new Logic();
String result = '';

class Screen extends StatefulWidget {
  final title;

  Screen({this.title});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      result = '';
    });
  }

  inputFormattin() {
    if (widget.title == '凱薩密碼' || widget.title == '維吉尼亞密碼')
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
      ];
  }

  keyFormattin() {
    if (widget.title == '凱薩密碼' || widget.title == "籬笆密碼")
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
      ];
    else if (widget.title == '維吉尼亞密碼' ||
        widget.title == '關鍵字密碼')
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
      ];
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController input = TextEditingController();
  TextEditingController key = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextFormField(
                    controller: input,
                    inputFormatters: inputFormattin(),
                    validator: (value) {
                      if (value!.isEmpty) return 'Required';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        hintText: 'Input'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextFormField(
                    controller: key,
                    inputFormatters: keyFormattin(),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Required';
                      else if (widget.title == '籬笆密碼' &&
                          int.parse(value) > input.text.length)
                        return '金鑰長度不要大於文字長度';
                      else if (widget.title == '波雷費密碼' &&
                          key.text.length < 6)
                        return '波雷費密碼的金鑰長度最少6個字元';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        hintText: 'Key'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate())
                            setState(() {
                              if (widget.title == "凱薩密碼")
                                result = logic.caesar(
                                    input.text, int.parse(key.text), 1);
                              else if (widget.title == "維吉尼亞密碼")
                                result =
                                    logic.vigenere(input.text, key.text, 1);
                              else if (widget.title == "籬笆密碼")
                                result = logic.railfenceEncrypt(
                                    input.text, int.parse(key.text));
                              else if (widget.title == "波雷費密碼")
                                result =
                                    logic.playfairEncrypt(input.text, key.text);
                              else if (widget.title == "關鍵字密碼")
                                result =
                                    logic.keywordEncrypt(input.text, key.text);
                            });
                        },
                        icon: Icon(Icons.lock_outline),
                        label: Text('加密'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Background color
                          onPrimary: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate())
                            setState(() {
                              if (widget.title == "凱薩密碼")
                                result = logic.caesar(
                                    input.text, int.parse(key.text), 0);
                              else if (widget.title == "維吉尼亞密碼")
                                result =
                                    logic.vigenere(input.text, key.text, 0);
                              else if (widget.title == "籬笆密碼")
                                result = logic.railfenceDecrypt(
                                    input.text, int.parse(key.text));
                              else if (widget.title == "波雷費密碼")
                                result =
                                    logic.playfairDecrypt(input.text, key.text);
                              else if (widget.title == "關鍵字密碼")
                                result =
                                    logic.keywordDecrypt(input.text, key.text);
                            });
                        },
                        icon: Icon(Icons.lock_open_rounded),
                        label: Text('解密'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: ListTile(
                      title: Text(
                    '輸出文字',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: ListTile(
                      title: Text(
                    result,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
              ]),
            )
          ],
        ));
  }
}
