import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class myImagelabelling extends StatefulWidget {
  @override
  _myImagelabellingState createState() => _myImagelabellingState();
}

class _myImagelabellingState extends State<myImagelabelling> {
  File pickedImage;
  var text_label = '';
  var text_con = 0.0; 

  bool imageLoaded = false;

    Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
    });

    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);

    final ImageLabeler cloudLabeler =
        FirebaseVision.instance.cloudImageLabeler();

    final List<ImageLabel> cloudLabels =
        await cloudLabeler.processImage(visionImage);

    for (ImageLabel label in cloudLabels) {
      final double confidence = label.confidence;
      setState(() {
        
        text_label = label.text;
        text_con = confidence;

        print(text_label);
      });
    }

    cloudLabeler.close();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.black54, 
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0), 
            child: RaisedButton(
              child: Text("Start the Process"), 
              color: Colors.white,
              onPressed: (){
                pickImage();
              }
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
          text_label == ''
              ? Text('Text will display here')
              : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        text_label,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }


  
  }

  
