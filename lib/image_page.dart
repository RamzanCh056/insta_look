import 'dart:io';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
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
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
];
Color primaryColor = mycolors[0];

class _ImagesPageState extends State<ImagesPage> {
  String? fileName;
 // List<Filter> filters = presetFiltersList;
  final picker = ImagePicker();
  File? imageFile;

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
          child: Stack(
            children: [
              buildImage(),
              buildColorIcons(),

              SizedBox(
                height: 30,
              ),
              // CarouselWithDotsPage(imgList: imgList),
            ],
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
        right: 10,
        child: Row(
          children: [for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])],
        ),
      );
  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            Positioned(
              top: 12.5,
              left: 12.5,
              child: Icon(
                Icons.check,
                size: 20,
                color: primaryColor == myColor ? myColor : Colors.transparent,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(0.65),
                size: 30,
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
}