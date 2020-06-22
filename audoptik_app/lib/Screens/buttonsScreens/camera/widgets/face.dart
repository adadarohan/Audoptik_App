import 'dart:io';

import 'package:audoptik_app/helper.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class myFaceRec extends StatefulWidget {
  @override
  _myFaceRecState createState() => _myFaceRecState();
}

class _myFaceRecState extends State<myFaceRec> {
   
  static double rotY; 
  static double rotZ; 
  static double smiling; 

  static int id; 
  static bool isFaceDetected = false; 
  static String retVal1 = "error", retval2  = "error", retVal3 = "error"; 
  File pickedImage;
  var imageFile;
  List<Rect> rect = new List<Rect>();
  

 static help obj = new help(); 
 static double width_button = obj.width;
 static double height_button = obj.height; 

  Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.camera);

    imageFile = await awaitImage.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);

    setState(() {
      imageFile = imageFile;
      pickedImage = awaitImage;
    });
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);

    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
        enableLandmarks: false, 
        enableTracking: true, 
        enableClassification: true, 
        enableContours: false, 
      )
    );
    final List<Face> faces = await faceDetector.processImage(visionImage);
    if (rect.length > 0) {
      rect = new List<Rect>();
    }
    for (Face face in faces) {
     
      rotY =  face.headEulerAngleY; // Head is rotated to the right rotY degrees
      rotZ =  face.headEulerAngleZ; // Head is tilted sideways rotZ degrees
      if(face.smilingProbability != null){
        smiling = face.smilingProbability;

      }
      else if(face.trackingId != null){
        id = face.trackingId; 
      }
      /*print('the rotation y is ' + rotY.toStringAsFixed(2));
      print('the rotation z is ' + rotZ.toStringAsFixed(2));*/
    }

    setState(() {
      isFaceDetected = true;
    });
    if(isFaceDetected == true){
      retval2 = rotY.toStringAsFixed(2);
      retVal3 = rotZ.toStringAsFixed(2);
      if(smiling >= 0.7){
        retVal1 = "The person seems happy"; 

      } else if(smiling >= 0.3 && smiling<0.7){
        retVal1 = "The person seems neutral"; 
      } else if(smiling<0.3){
        retVal1 = "The person does not seem very happy."; 
      }
    } else{
      retVal1 = "The image was unclear improper, please try again. "; 
    } 
    print(retval2);
    print(retVal1);
    print(retVal3);

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black54,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0), 
            child: ButtonTheme(
              minWidth: width_button, 
              height: height_button,
              child: RaisedButton(
                child: Text("Start Detection"),
                onPressed: (){
                  pickImage();

                },

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0), 
            child: Text(
              retVal1, 
              style: TextStyle(
                fontSize: 25,
                color: Colors.white 

                
              ),
              ),
            ),
            Padding(
            padding: EdgeInsets.all(20.0), 
            child: Text(
              retval2, 
              style: TextStyle(
                fontSize: 25, 
                color: Colors.white, 

              ),
              ),
            ),
            Padding(
            padding: EdgeInsets.all(20.0), 
            child: Text(
              retVal3, 
              style: TextStyle(

                fontSize: 25,
                color: Colors.white 
              ),
              ),
            ),
        ],
      ),
      
    );
  }
}