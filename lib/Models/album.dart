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
class filters extends StatelessWidget {
  const filters({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
   GlobalKey _globalKey = GlobalKey();

  String? fileName;
  List<Filter> filters = presetFiltersList;
  final picker = ImagePicker();
  File? imageFile;
  File? _image;

  Future getImage(context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile!=null){
    imageFile = new File(pickedFile.path);
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
  //bool  PhotoFilterSelector = true;
      // List<String>imagpath = [imageFile!.path.toString()];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Single filter', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
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
                           
                             GallerySaver.saveImage(imageFile!.path, albumName: 'Hello')
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
        ),
      ),
      
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

 void _onShare(BuildContext context) async {
    
    final box = context.findRenderObject() as RenderBox?;
       List<String>imagpath = [imageFile!.path.toString()];
         //  List<String> imagpath  = [];


    if (imagpath.isNotEmpty) {
      await Share.shareFiles(imagpath
       
          );
    }
  }
 
}