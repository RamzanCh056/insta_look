
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:insta_look/Banner_user_side.dart';
import 'package:insta_look/stripe.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:insta_look/upgradeto-pro.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';


import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SendPicture();
  }
}

  


Future<AddIssue> createIssues(
  String image,
) async {
  final response = await http.post(
    //https://admin.noqta-market.com/new/API/CreateIssues.php
    //https://dev.noqta-market.com/API/AddBanner.php
    Uri.parse('https://dev.noqta-market.com/API/AddBanner.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'image': image,
    }),
  );
  if (response.statusCode == 201) {
   
    
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    print('Image uploaded Successfully');
    
    
    return AddIssue.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print('Failed to upload');
     
    throw Exception('Failed to upload image.');
  }
}

class AddIssue {
  //final int id;

  final String image;

  const AddIssue({
    required this.image,
  });

  factory AddIssue.fromJson(Map<String, dynamic> json) {
    return AddIssue(
      image: json['image'],
    );
  }
}

class SendPicture extends StatefulWidget {
  SendPicture({Key? key}) : super(key: key);

  @override
  State<SendPicture> createState() => _SendPictureState();
}

class _SendPictureState extends State<SendPicture> {
  Future<AddIssue>? _futureIssues;
  PickedFile? _imagefile;
  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.grey),
            onPressed: () {
              showImagePicker(context);
            },
            child: Text('choose_image'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              // color: Colors.black,
              height: 130,
              width: 150,
              child: imagepath == null
                  ? Container()
                  : Image.file(
                      File(imagepath),
                      fit: BoxFit.fill,
                    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
              )),
          SizedBox(
            height: 50,
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                try {
                  if (imagepath != null) {
                    _futureIssues = createIssues(imagepath);
                  } else {
                   ( 'All Fields are required');
                  }
                } catch (e) {
                  print(e);
                }
              },
              color: Color(0xffff6e01),
              padding: EdgeInsets.symmetric(horizontal: 50),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "save",
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void showImagePicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(
                      'Photo library',
                      // 'Гэрэл зургийн номын сан'
                    ),
                    onTap: () {
                      openGalleryImage();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: Text(
                    'Camera',
                    // 'Камер'
                  ),
                  onTap: () {
                    openCameraImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  openGalleryImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        print(imagepath);
        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        String base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        print(base64string);
        /* Output:
              /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
              wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
              AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
              */

        Uint8List decodedbytes = base64.decode(base64string);
        //decode base64 stirng to bytes

        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  openCameraImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.camera);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        print(imagepath);
        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        String base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        print(base64string);
        /* Output:
              /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
              wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
              AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
              */

        Uint8List decodedbytes = base64.decode(base64string);
        //decode base64 stirng to bytes

        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
}