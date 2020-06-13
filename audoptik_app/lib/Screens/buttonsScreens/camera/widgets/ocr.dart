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
     return Scaffold(
       backgroundColor: Colors.black54 ,
       body: ListView(
         children: <Widget>[
           Padding(
             padding: EdgeInsets.all(20.0),
             child: ButtonTheme(
               minWidth: 100,
               height: 65,
               child: RaisedButton(
                 child: Text("Start Scanning"),
                 color: Colors.white,
                 onPressed: (){
                   _read();

                 }
               )
             )
           )
         ]
       ),
     );
    
  }
 
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

  
  