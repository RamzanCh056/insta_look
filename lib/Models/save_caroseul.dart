import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/models/crope_n.dart';
import 'package:share_plus/share_plus.dart';

class SaveCaresol extends StatefulWidget {
  final List<String> urlImages;
  SaveCaresol({Key? key, required this.urlImages}) : super(key: key);

  @override
  State<SaveCaresol> createState() => _SaveCaresolState();
}

class _SaveCaresolState extends State<SaveCaresol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Instalook'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            CarouselSlider(
              items: widget.urlImages
                  .map((item) => Container(
                        child: Center(
                            child: GestureDetector(
                          onTap: () async {
                            print('Clicked');
                          },
                          child: Image.file(
                            File(item),
                            fit: BoxFit.cover,
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
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                              //fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> IssueListApi ()));// signup
                        // var pathList = <String>[];
                        // int count = 0;
                        // for (var item in widget.urlImages) {
                        //   final bytes = await item.getByteData();
                        //   final temp = await getTemporaryDirectory();
                        //   final path = '${temp.path}/${count}image.jpg';

                        //   File(path).writeAsBytesSync(
                        //       bytes.buffer.asUint8List());
                        //   pathList.add(path);
                        //   count++;
                        // }

                       // await Share.shareFiles(widget.urlImages);
                      },
                      child: const Text(
                        'Post Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         filter(context);
                //       });
                //       // print('pathlist==$pathList');
                //     },
                //     child: Text('test'))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
