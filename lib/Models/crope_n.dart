import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/files.dart';
import 'package:insta_look/Banner_user_side.dart';
import 'package:insta_look/pages/instapayment.dart';
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
  var   pickedImage;
class Newcroperfollow extends StatefulWidget {
  const Newcroperfollow({ Key? key }) : super(key: key);

  @override
  State<Newcroperfollow> createState() => _NewcroperfollowState();
}

class _NewcroperfollowState extends State<Newcroperfollow> {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


     // theme: ThemeData.light().copyWith(primaryColor: Colors.deepOrange),
      body: MyHomePage(
        title: 'Instalook croper',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AppState {
  free,
  picked,
  cropped,
  filter,
}

class _MyHomePageState extends State<MyHomePage> {
  late AppState state;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
               Center(
               child:   Column(children: [
            SizedBox(height: 60,),
             new Container(
              child: imageFile == null
                  ? Center(
                      child: new Text('No image selected.'),
                    ):
                  Container(
                    height:600,
                    width: double.infinity,
                   
                    child: Column(children: [
                       Container(height: 270,

                       
                        child: Image.file(new File(imageFile!.path, )),
                       ),
                        SizedBox(height: 30,),
                       Column(children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 45,right: 45),
                        child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.black,
                            minWidth: double.infinity,
                            height: 50,
                            
                              onPressed: () async{
                           
                             GallerySaver.saveImage(imageFile!.path, albumName: 'instalook')
                              .then((bool ) {
                            setState(() {
                            print("image saved!");
                            });
                          });
                     
                     
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save To Gallery'),));
                            
                            },
                           
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,color: Colors.white,
                              ),
                        
                            ),
                          ),
                        ],
                    ),
                      ),
                      SizedBox(height: 15,),
                    Padding(
                        padding: const EdgeInsets.only(left: 45,right: 45),
                        child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.black,
                            minWidth: double.infinity,
                            height: 50,
                            
                              onPressed: () async{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> IssueListApi ()));
                              // setState(() {
                                
                              //       _onShare(context);
                              // });
                     
                     
                            },
                           
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Post",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,color: Colors.white,
                              ),
                        
                            ),
                          ),
                        ],
                    ),
                      ),
                  
                    ],),
                    ],)
                    
                   
        
                  ),
                  
            ),
              SizedBox(height: 20,),
                
                    
                   
                  
                  
                   
                      
                    
        
                    
          ],),
                 
            // child: imageFile != null ? Image.file(imageFile!)
            //  : Container(),

        
            
          ),
          ],
        
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          if (state == AppState.free)
            _pickImage();
          else if (state == AppState.picked)
            _cropImage();
          else if (state == AppState.cropped) filter(context);
        },
        child: _buildButtonIcon(),
      ),
    );
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(Icons.add);
    else if (state == AppState.picked)
      return Icon(Icons.crop);
      
    else if (state == AppState.cropped)
      return Icon(Icons.filter);
    else
      return Container();
  }
     String? fileName;
  Future<Null> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
        setState(() {
        state = AppState.picked;
      });
    
    }
    // if (state == AppState.cropped )
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }
    final picker = ImagePicker();
   Future filter ( context) async{
      
    //final pickedFile = await picker.getImage(source: ImageSource.gallery);
    
        if(imageFile!=null) {
    imageFile = new File(imageFile!.path);
    fileName = basename(imageFile!.path);
    var image = imageLib.decodeImage(await imageFile!.readAsBytes());
    image = imageLib.copyResize(image!, width: 600);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text(" insta look"),
          appBarColor: Colors.black,
          image: image!,
          filters: presetFiltersList,
          filename: fileName!,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
      
      print(imageFile!.path);
    }
    }
    
      
   }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }
}