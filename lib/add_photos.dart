import 'dart:math';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_look/image_page.dart';
import 'package:insta_look/models/crope_n.dart';
import 'package:insta_look/post_page.dart';
import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Multi(),
    );
  }
}

class Multi extends StatelessWidget {
  const Multi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyImages {
  File? imageSource;
  bool? isSelected;
  int? index;

  MyImages(File? ImageSource, bool? IsSelected, int? Index) {
    imageSource = ImageSource;
    isSelected = IsSelected;
    index = Index;
  }
}

List mycolors = <Color>[
  Color.fromARGB(255, 202, 193, 193),
  Color.fromARGB(255, 103, 155, 197),
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
  Color.fromARGB(239, 158, 158, 158),
];
Color primaryColor = mycolors[0];

class _MyAppState extends State<MyApp> {
  final controller = DragSelectGridViewController();

  HashSet selectItems = HashSet();
  PickedFile? _imagefile;
  bool isMultiSelectionEnabled = false;
  List<Asset> images = <Asset>[];
  List<Asset> SelectedImages = <Asset>[];
  List<MyImages> MyimagesList = <MyImages>[];
  bool isclicked = false;

  Widget builderGrid() {
    return DragSelectGridView(
        gridController: controller,
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, crossAxisCount: 3, mainAxisSpacing: 8),
        itemBuilder: (context, index, isSelected) {
          // if (isSelected) {
          //   if (MyimagesList.isNotEmpty &&
          //       MyimagesList.where((element) => element.index == index)
          //               .length ==
          //           0) {
          //     MyimagesList.add(new MyImages(images[index], isSelected, index));
          //   } else if (MyimagesList.isEmpty) {
          //     MyimagesList.add(new MyImages(images[index], isSelected, index));
          //   }
          // } else if (images != null && !isSelected) {
          //   //MyimagesList.remove(value);
          // }
          // print('Index of img=${images[index]}');
          // Asset asset = images[index];
          // print('Index of img=${asset}');
          return isSelected
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
                  child: Container(
                    color: Colors.white,
                    child: Transform.translate(
                      offset: Offset(1, -0),
                      child: Transform.rotate(
                        angle: pi / 0.1,
                        child: isSelected
                            ? SelectableItemWidget(
                                url: images[index], IsSelected: isSelected)
                            //   ListView(children: images.map((e) =>
                            //     ).toList()
                            // )
                            : SelectableItemWidget(
                                url: images[index], IsSelected: isSelected),
                      ),
                    ),
                  ))
              : SelectableItemWidget(
                  url: images[index], IsSelected: isSelected);
          // AssetThumb(asset: images[index], width: 100, height: 100);
          // SelectableItemWidget(url: images[index], IsSelected: isSelected);
        });
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    //String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#032445",
          actionBarTitle: "Instalook",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      // error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      // _error = error;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  void scheduleRebuild() => setState(() {});
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final isSelect = controller.value.isSelecting;
    var AssetSelected = controller.value.selectedIndexes.map<Asset>((index) {
      return images[index];
    }).toList();
    final text = isSelect
        ? '${controller.value.amount} Selected image'
        : ('aestheticpie');
    ColorFiltered(
        colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
        child: Container(
          color: Colors.white,
          child: Transform.translate(
            offset: Offset(1, -30),
            child: Transform.rotate(
              angle: pi / 0.1,
              child: isSelect
                  ? ListView(
                      children: AssetSelected.map(
                      (e) => AssetThumb(asset: e, width: 100, height: 100),
                    ).toList())
                  : Container(),
            ),
          ),
        ));
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 18,
            ),
            //  Center(child: Text('Error: $_error')),
            // SizedBox(height: 40,),
            Expanded(
              child: builderGrid(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: MaterialButton(
                color: Colors.green,
                minWidth: 30,
                height: 50,
                onPressed: loadAssets,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.picture_in_picture_alt,
                      size: 25,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Add Pictures ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            // ElevatedButton(
            //   child: Text("Pick images"),
            //   onPressed: loadAssets,
            // ),
            // Expanded(
            //   child: builderGrid(),
            // ),

            Visibility(visible: isclicked, child: buildColorIcons()),
            // Expanded(child:Visibility(visible: isSelect,child:  buildColorIcons(),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ElevatedButton(
                //   child: Text("Swap"),
                //   onPressed: () {
                //     Asset Item1 = images
                //         .where((element) =>
                //             element == MyimagesList.first.imageSource)
                //         .single;

                //     int Item1Index = images.indexOf(Item1);
                //     Asset Item2 = images
                //         .where((element) =>
                //             element == MyimagesList.last.imageSource)
                //         .single;
                //     int Item2Index = images.indexOf(Item2);

                //     var tmp = images[Item1Index];
                //     images[Item1Index] = images[Item2Index];
                //     images[Item2Index] = tmp;
                //   },
                // ),
                // ElevatedButton(
                //   child: Text("Carosuel"),
                //   onPressed: () {
                //     setState(() {
                //       if (isSelect == true) {
                //         var AssetSelected = controller.value.selectedIndexes
                //             .map<Asset>((index) {
                //           return images[index];
                //         }).toList();
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => ImagesPage(
                //                   urlImages: AssetSelected,
                //                   IsSelected: isSelect,
                //                 )
                //                 ),
                //                 );
                //         print('AssetSelectedimages==$AssetSelected');
                //       } else {
                //         var AssetSelected = controller.value.selectedIndexes
                //             .map<Asset>((index) {
                //           return images[index];
                //         }).toList();
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => ImagesPage(
                //                   urlImages: AssetSelected,
                //                   IsSelected: isSelect,
                //                 )));
                //         print('AssetSelectedimages==$AssetSelected');
                //         print('images=$images');
                //         print('no images in the list');
                //       }
                //     });
                //   },
                // ),
              ],
            )
          ],
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
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                    label: ("Preview"),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.swap_calls),
                    label: 'Swap',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.filter),
                    label: 'Filter',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.camera_outdoor_sharp),
                    label: 'Carousal',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.download),
                    label: 'Save',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.delete_forever),
                    label: 'Delete',
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
                      print('abc');

                      isclicked = !isclicked;
                      buildColorIcons();
                    });
                  }
                  ;
                  if (value == 3) {
                    setState(() {
                      if (isSelect == true) {
                        var AssetSelected = controller.value.selectedIndexes
                            .map<Asset>((index) {
                          return images[index];
                        }).toList();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ImagesPage(
                                    urlImages: AssetSelected,
                                    IsSelected: isSelect,
                                  )),
                        );
                        print('AssetSelectedimages==$AssetSelected');
                      } else {
                        var AssetSelected = controller.value.selectedIndexes
                            .map<Asset>((index) {
                          return images[index];
                        }).toList();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImagesPage(
                                  urlImages: AssetSelected,
                                  IsSelected: isSelect,
                                )));
                        print('AssetSelectedimages==$AssetSelected');
                        print('images=$images');
                        print('no images in the list');
                      }
                    });
                  }
                  ;
                  if (value == 23) ("two");
                  if (value == 4) ("two");
                  if (value == 5) ("two");
                },
              ),
            )));
  }

  String getSelectedItemCount() {
    return selectItems.isNotEmpty
        ? selectItems.length.toString() + " item selected"
        : "No item selected";
  }

  Widget buildImage() => Container(
        width: 50,
        height: 50,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
          child: Container(
            color: Colors.white,
            child: Transform.translate(
              offset: Offset(1, -30),
              child: Transform.rotate(
                angle: pi / 0.1,
                child: CarouselSlider(
                  items: images
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

  Widget buildColorIcons() => Row(
        children: [for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])],
      );

  Widget buildIconBtn(Color myColor) => Container(
        child: Column(
          children: [
            // Positioned(
            //   top: 18.5,
            //   left: 20.5,
            //   child: Icon(
            //     Icons.check,
            //     size: 26,
            //     color: primaryColor == myColor ? myColor : Colors.transparent,
            //   ),
            // ),

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
                size: 50,
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
  // void _onDeleteImage(int position) {
  //   setState(() {
  //     imagePaths.removeAt(position);
  //   });
  // }

}

class SelectableItemWidget extends StatefulWidget {
  final Asset url;
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
        child: AssetThumb(
          asset: widget.url,
          width: 300,
          height: 300,
        ),
      )),
    );
  }
}
