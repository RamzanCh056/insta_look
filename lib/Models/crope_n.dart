import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_look/add_photos.dart';
import 'package:insta_look/models/save_caroseul.dart';
import 'package:insta_look/models/save_filtered_images.dart';
import 'package:insta_look/post_page.dart';
import 'package:insta_look/small_navigation.dart';
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

var pickedImage;

class Newcroperfollow extends StatefulWidget {
  const Newcroperfollow({Key? key}) : super(key: key);

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

List<File> savedImages = <File>[];
File? imageFile;

class _MyHomePageState extends State<MyHomePage> {
  // List<File> SelectedImages = <File>[];
  List<MyImages> MyimagesList = <MyImages>[];
  int _selectedIndex = 0;
  final controller = DragSelectGridViewController();

  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
    state = AppState.free;
  }

  Widget builderGrid() {
    return DragSelectGridView(
        gridController: controller,
        itemCount: savedImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, crossAxisCount: 3, mainAxisSpacing: 8),
        itemBuilder: (context, index, isSelected) {
          if (isSelected) {
            if (MyimagesList.isNotEmpty &&
                MyimagesList.where((element) => element.index == index)
                        .length ==
                    0) {
              MyimagesList.add(
                  new MyImages(savedImages[index], isSelected, index));
            } else if (MyimagesList.isEmpty) {
              MyimagesList.add(
                  new MyImages(savedImages[index], isSelected, index));
            }
          } else if (savedImages != null && !isSelected) {
            // MyimagesList.remove(value);
          }
          savedImages = savedImages;
          if (isSelected == false) {
            return Stack(overflow: Overflow.visible, children: [
              Positioned(
                child: Image.file(
                  File(savedImages[index].path).absolute,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  left: 90,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          savedImages.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.red))),
            ]);
          }

          return isSelected
              ? SelectableItemWidget(
                  url: savedImages[index].path, IsSelected: isSelected)
              : Container();
        });
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  void scheduleRebuild() => setState(() {});
  late AppState state;

  @override
  Widget build(BuildContext context) {
    final isSelect = controller.value.isSelecting;
    var AssetSelected = controller.value.selectedIndexes.map<String>((index) {
      return savedImages[index].path;
    }).toList();
    final text =
        isSelect ? '${controller.value.amount} Selected image' : ('Instalook');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: isSelect ? CloseButton() : Container(),
          title: Text(
            text.toString(),
          ),

          // title: Text('aestheticpie'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          // leading: isSelect ? CloseButton() : Container(),
          // title: Text(text.toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    new Container(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 90, right: 90),
                      child: MaterialButton(
                        //  color: Colors.white,
                        minWidth: 30,
                        height: 50,

                        onPressed: () {
                          if (imageFile == null || imageFile != null) {
                            _pickImage();
                          }

                          setState(() {
                            // imageFile;
                            _showMyDialog(context);
                          });
                        },

                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add a Picture",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         _showMyDialog(context);
                    //       });
                    //     },
                    //     child: Text('dialog')),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                // child: imageFile != null ? Image.file(imageFile!)
                //  : Container(),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 400,
                child: builderGrid(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Visibility(
            visible: isSelect,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
                bottomLeft: Radius.circular(22.0),
                bottomRight: Radius.circular(22.0),
              ),
              child: BottomNavigationBar(
                //elevation: 0.0,

                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.swap_calls),
                    label: 'Swap',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.visibility),
                    label: 'Preview',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.download),
                    label: 'Save',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.camera_outdoor_sharp),
                    label: 'Carousal',
                  ),
                ],
                currentIndex: _selectedIndex,
                fixedColor: Colors.white,
                //selectedItemColor: Colors.blue,
                // selectedLabelStyle: Colors.white,
                unselectedItemColor: Colors.white,

                //  selectedItemColor: Colors.white,

                onTap: (value) {
                  if (value == 0) {
                    setState(() {
                      File Item0 = savedImages
                          .where((element) =>
                              element == MyimagesList.first.imageSource)
                          .single;
                      int Item0Index = savedImages.indexOf(Item0);
                      File Item1 = savedImages
                          .where((element) =>
                              element == MyimagesList.last.imageSource)
                          .single;
                      int Item1Index = savedImages.indexOf(Item1);

                      var tmp = savedImages[Item0Index];
                      savedImages[Item0Index] = savedImages[Item1Index];
                      savedImages[Item1Index] = tmp;
                    });
                  }
                  ;
                  if (value == 1) {
                    setState(() {
                      if (isSelect == true) {
                        var AssetSelected = controller.value.selectedIndexes
                            .map<String>((index) {
                          return savedImages[index].path;
                        }).toList();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PreviewDart(
                                  urlImages: AssetSelected,
                                )));
                        print('AssetSelectedimages==$AssetSelected');
                      }
                    });
                  }
                  ;

                  if (value == 2) {
                    setState(() {
                      var AssetSelected =
                          controller.value.selectedIndexes.map<String>((index) {
                        return savedImages[index].path;
                      }).toList();
                      GallerySaver.saveImage(savedImages[1].path,
                              albumName: 'instalook')
                          .then((bool) {
                        setState(() {
                          print("image saved!");
                        });
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Save To Gallery'),
                      ));
                    });
                  }
                  ;
                  if (value == 3) {
                    setState(() {
                      if (isSelect == true) {
                        var AssetSelected = controller.value.selectedIndexes
                            .map<String>((index) {
                          return savedImages[index].path;
                        }).toList();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SaveCaresol(
                                    urlImages: AssetSelected,
                                  )),
                        );
                        print('AssetSelectedimages==$AssetSelected');
                      } else {
                        var AssetSelected = controller.value.selectedIndexes
                            .map<String>((index) {
                          return savedImages[index].path;
                        }).toList();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SaveCaresol(
                                  urlImages: AssetSelected,
                                )));
                        print('AssetSelectedimages==$AssetSelected');
                      }
                    });
                  }
                  ;
                },
              ),
            ))
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black,
        //   onPressed: () {
        //     if (state == AppState.free)
        //       _pickImage();
        //     else if (state == AppState.picked)
        //       _cropImage();
        //     else if (state == AppState.cropped) filter(context);
        //   },
        //   child: _buildButtonIcon(),
        // ),
        );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Photo Editor'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          imageFile != null
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Container(
                                        height: 270,
                                        child: Image.file(new File(
                                          imageFile!.path,
                                        )),
                                      );
                                    });
                                  },
                                  child: Container(
                                    height: 270,
                                    child: Image.file(new File(
                                      imageFile!.path,
                                    )),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      imageFile;
                                      // Container(
                                      //   height: 270,
                                      //   child: Image.file(new File(
                                      //     imageFile!.path,
                                      //   )),
                                      // );
                                    });
                                  },
                                  child: Container(
                                    height: 80, color: Colors.grey,
                                    child: Center(child: Text('Tap Here')),
                                    // child: Image.file(new File(
                                    //   imageFile!.path,
                                    // )),
                                  ),
                                ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 45, right: 45),
                                child: Column(
                                  children: [
                                    MaterialButton(
                                      color: Colors.black,
                                      minWidth: double.infinity,
                                      height: 50,
                                      onPressed: () async {
                                        filter(context);
                                      },
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Filter",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    MaterialButton(
                                      color: Colors.black,
                                      minWidth: double.infinity,
                                      height: 50,
                                      onPressed: () async {
                                        _cropImage();
                                      },
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Crop",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 45, right: 45),
                                child: Column(
                                  children: [
                                    MaterialButton(
                                      color: Colors.black,
                                      minWidth: double.infinity,
                                      height: 50,
                                      onPressed: () async {
                                        // Navigator.of(context).pop();
                                        // if (savedImages!=null) {

                                        // }
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainBottomClass()));
                                          savedImages.add(imageFile!);
                                          print('avc=$savedImages');
                                        });

                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             FilteredImages()));
                                        // GallerySaver.saveImage(
                                        //         imageFile!.path,
                                        //         albumName: 'instalook')
                                        //     .then((bool) {
                                        //   setState(() {
                                        //     print("image saved!");
                                        //   });
                                        // });

                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //   content:
                                        //       Text('Save To Gallery'),
                                        // ));
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
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
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
  Future filter(context) async {
    //final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (imageFile != null) {
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

class SelectableItemWidget extends StatefulWidget {
  final String url;
  // final VoidCallback onTap;
  final bool IsSelected;
  SelectableItemWidget(
      {Key? key,
      // required this.onTap,
      required this.url,
      required this.IsSelected})
      : super(key: key);

  @override
  State<SelectableItemWidget> createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print('==${widget.url}');

        // widget.onTap;
        if (widget.IsSelected == true) {
          print('pic selected');
        }
      },
      child: ClipRRect(

          // borderRadius: BorderRadius.circular(widget.IsSelected ? 80 : 0),
          child: Container(
        decoration: BoxDecoration(
            border: widget.IsSelected
                ? Border.all(width: 2, color: Colors.blue)
                : Border.all(width: 0)),
        child: Image.file(
          File(widget.url).absolute,
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      )),
    );
  }
}
