import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class myOCR extends StatefulWidget {
  @override
  _myOCRState createState() => _myOCRState();
}

class _myOCRState extends State<myOCR> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "sample";

  @override
 void initState() {
  super.initState();
  FlutterMobileVision.start().then((x) => setState(() {}));
}
  Widget build(BuildContext context) {
     return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lime,
        buttonColor: Colors.lime,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Mobile Vision'),
        ),
        body: Center(
            child: new ListView(
          children: <Widget>[
            new Text(_textValue),
            new RaisedButton(
              onPressed: _read,
              child: new Text('Start Scanning'),
            ),
          ],
        )),
      ),
    );
    
  }
 List<OcrText> texts = [];
 Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}

  
  