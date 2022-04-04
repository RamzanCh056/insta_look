import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:insta_look/models/api.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:photofilters/photofilters.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

// import 'package:share_plus/share_plus.dart';

// import 'image_previews.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;

class ImagesPage extends StatefulWidget {
  final List<Asset> urlImages;
  final bool IsSelected;
  const ImagesPage({
    Key? key,
    required this.IsSelected,
    required this.urlImages,
  }) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

List mycolors = <Color>[
  Color.fromARGB(255, 199, 87, 79),
  Color.fromARGB(255, 103, 155, 197),
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
  Color.fromARGB(239, 158, 158, 158),
  
];
Color primaryColor = mycolors[0];

class _ImagesPageState extends State<ImagesPage> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];
  List<String> Imagepath = [];
  var abc = <Map>[];
  String? fileName;
  // List<Filter> filters = presetFiltersList;
  final picker = ImagePicker();
  String img =
      'https://www.google.com/search?q=hd+pic&client=opera&sxsrf=APq-WBtgRbNMeFl5ocZsCoi22Sr0rlcHpQ:1648452076026&tbm=isch&source=iu&ictx=1&vet=1&fir=F7qLiSEVgMA85M%252C1BICcH_JOrKSGM%252C_%253BWJb3TVRKqLlSKM%252C1BICcH_JOrKSGM%252C_%253BAFQUz60ncbLJDM%252C4lC03l2w6p3goM%252C_%253BXzYtWNnew5ppKM%252CXlWKuS0PLVzVvM%252C_%253BCpQJxsmiFIrfeM%252CgG8Dz6-EhYyoqM%252C_%253BnwSH5vd8IdLPTM%252C0YhkbdsB8sWdIM%252C_%253BfDXdTcwv-imWfM%252Cxbn5uQ0dPjUOKM%252C_%253B1BnveNRKQT-vFM%252CBRQct-YTvGtC2M%252C_%253BVLt6UGxTtfP2SM%252ChKml9mxsyIGEsM%252C_%253BqzvZNraHWUqcwM%252C0FUovVO7K5iByM%252C_%253BGV-eCBDAgYcXEM%252CNyRWMDngXPoFDM%252C_%253BDLvqNfZoSxNa9M%252C1BICcH_JOrKSGM%252C_%253BzMvhevU8ByrepM%252Cdi_MXDo454hmwM%252C_%253Br0LIDXEFCcoegM%252C1BICcH_JOrKSGM%252C_%253BSdr0-chTv5LL4M%252CGDuOwkV5uCFqoM%252C_%253BY1gjxnkfVNFsUM%252CztC-YSeKEsdE_M%252C_%253BCTCXtrPcu5eXzM%252ChKml9mxsyIGEsM%252C_%253B0wrmBU--RQM-sM%252C40fK7PW5KU30XM%252C_&usg=AI4_-kTqcfzzCnWeJXxfQdqo7YS0m8Ea8g&sa=X&ved=2ahUKEwjVwq7Douj2AhWIyYUKHf65CisQ9QF6BAgBEAE#imgrc=F7qLiSEVgMA85M';

  // File? imageFile;

  @override
  Widget build(BuildContext context) {
    //  Asset asset = widget.urlImages;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('aestheticpie'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: SafeArea(
          child:
              //     ListView(
              //   children: widget.urlImages
              //       .map(
              //         (urlimage) => AssetThumb(
              //           asset: urlimage,
              //           // fit: BoxFit.cover,
              //           width: 1000,
              //           height: 600,
              //         ),
              //       )
              //       .toList(),
              // )
              SingleChildScrollView(
            child: Stack(
              children: [
                buildImage(),
                buildColorIcons(),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // TextField(
                      //   decoration: const InputDecoration(
                      //     labelText: 'Share text:',
                      //     hintText: 'Enter some text and/or link to share',
                      //   ),
                      //   maxLines: 2,
                      //   onChanged: (String value) => setState(() {
                      //     text = value;
                      //   }),
                      // ),
                      // TextField(
                      //   decoration: const InputDecoration(
                      //     labelText: 'Share subject:',
                      //     hintText: 'Enter subject to share (optional)',
                      //   ),
                      //   maxLines: 2,
                      //   onChanged: (String value) => setState(() {
                      //     subject = value;
                      //   }),
                      // ),
                      const Padding(padding: EdgeInsets.only(top: 12.0)),
                      // ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                      // ListTile(
                      //   leading: const Icon(Icons.add),
                      //   title: const Text('Add image'),
                      //   onTap: () async {
                      //     final imagePicker = ImagePicker();
                      //     final pickedFile = await imagePicker.pickImage(
                      //       source: ImageSource.gallery,
                      //     );
                      //     if (pickedFile != null) {
                      //       setState(() {
                      //         imagePaths.add(pickedFile.path);
                      //       });
                      //     }
                      //   },
                      // ),
                      const Padding(padding: EdgeInsets.only(bottom: 390.0 , left: 120)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Builder(
                            builder: (BuildContext context) {
                              return 
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                primary: Colors.black,
               // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                //fontSize: 30,
                fontWeight: FontWeight.bold)),
                                onPressed: () async {
                                  // final files = await widget.urlImages
                                  //     .map<String>((file) => file.name.toString())
                                  //     .toList();
                                  // print("file==$files");
                                  var pathList = <String>[];
                                  int count = 0;
                                  for (var item in widget.urlImages) {
                                    // var data = await PlatformAssetBundle()
                                    //     .load(widget.urlImages.toString());
                                    // print("file==$data");
                                    // ByteData imageData1 = await rootBundle
                                    //     .load(widget.urlImages.toString());

                                    // print('imgdata=$imageData1');
                                    final bytes = await item.getByteData();
                                    final temp = await getTemporaryDirectory();
                                    final path = '${temp.path}/${count}image.jpg';

                                    File(path).writeAsBytesSync(
                                        bytes.buffer.asUint8List());
                                    pathList.add(path);
                                    count++;
                                  }

                                  await Share.shareFiles(pathList);
                                  // print("uri==$url");
                                  // var imagePath =
                                  //     '${imagesURL.first.identifier}/${imagesURL.first.name}';

                                  // print("path==$url");
                                },

                                // text.isEmpty ? null : () => _onShare(context),

                                //text.isEmpty ? null : () => _onShare(context),
                                child: const Text('Post Now', style: TextStyle(color: Colors.white),),
                              );
                            },
                          ),
                        ],
                      ),
                     // const Padding(padding: EdgeInsets.only(top: 12.0)),
                      // Builder(
                      //   builder: (BuildContext context) {
                      //     return ElevatedButton(
                      //       onPressed: text.isEmpty
                      //           ? null
                      //           : () => _onShareWithResult(context),
                      //       child: const Text('Share With Result'),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildImage() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
          child: Container(
            color: Colors.white,
            child: Transform.translate(
              offset: Offset(1, -30),
              child: Transform.rotate(
                angle: pi / 0.1,
                child: CarouselSlider(
                  items: widget.urlImages
                      .map((item) => Container(
                            child: Center(
                                child: GestureDetector(
                              onTap: () async {
                                print('Clicked');
                              },
                              child: AssetThumb(
                                asset: item,
                                // fit: BoxFit.cover,
                                width: 1000,
                                height: 600,
                              ),
                            )),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildColorIcons() => Positioned(
        bottom: 35,
        right: 40,
        child: Row(
          children: [for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])],
        ),
      );
  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            Positioned(
              top: 18.5,
              left: 20.5,
              child: Icon(
                Icons.check,
                size: 26,
                color: primaryColor == myColor ? myColor : Colors.transparent,
              ),
            ),

            // Row(children: [
            //         GestureDetector(
            //           onTap:(){setState(() {
            //              primaryColor = myColor;
            //           });},
            //           child: Container(
            //             width: 40,
            //             height: 50,
            //             color: myColor,
            //           ),
            //         )
             
            // ],),
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(0.65),
                size: 60,
              ),
              onPressed: () {
                setState(() {
                  
                  primaryColor = myColor;
                });
              },
            ),
          ],
        ),
      );
  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    if (widget.urlImages.isNotEmpty) {
      final files = await widget.urlImages
          .map<String>((file) => file.toString())
          .toList();

      print("file==$files");
      await Share.shareFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    ShareResult result;
    if (widget.urlImages.isNotEmpty) {
      final files = await widget.urlImages
          .map<String>((file) => file.identifier.toString())
          .toList();
      print("file==$files");
      result = await Share.shareFilesWithResult(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      result = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Share result: ${result.status}"),
    ));
  }
}