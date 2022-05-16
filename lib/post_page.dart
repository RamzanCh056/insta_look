import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_look/Banner_user_side.dart';
import 'package:insta_look/pages/instapayment.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PreviewDart extends StatefulWidget {
  final List<String> urlImages;
  const PreviewDart({Key? key, required this.urlImages}) : super(key: key);

  @override
  State<PreviewDart> createState() => _PreviewDartState();
}

class _PreviewDartState extends State<PreviewDart> {
  String text = '';
  String subject = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          children: widget.urlImages
                              .map(
                                (urlimg) => Image.file(
                                  File(urlimg).absolute,
                                  fit: BoxFit.cover,
                                  width: 380,
                                  height: 200,
                                ),
                                // AssetThumb(
                                //     asset: urlimg, width: 380, height: 200,)
                              )
                              .toList()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Share text:',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter some text and/or link to share',
                      ),
                      maxLines: 2,
                      onChanged: (String value) => setState(() {
                        text = value;
                      }),
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Share subject:',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter subject to share (optional)',
                      ),
                      maxLines: 2,
                      onChanged: (String value) => setState(() {
                        subject = value;
                      }),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 48.0)),
                    Builder(
                      builder: (BuildContext context) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            IssueListApi())); // signup
                              },

                              // text.isEmpty ? null : () => _onShare(context),

                              child: const Text('Post'),
                            ),
                          ],
                        );
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12.0)),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    var pathList = <String>[];
    int count = 0;
    // for (var item in widget.urlImages) {
    //   final bytes = await item.getByteData();
    //   final temp = await getTemporaryDirectory();
    //   final path = '${temp.path}/${count}image.jpg';

    //   File(path).writeAsBytesSync(bytes.buffer.asUint8List());
    //   pathList.add(path);
    //   count++;
    // }
    if (pathList.isNotEmpty) {
      final files = await widget.urlImages
          .map<String>((file) => file.toString())
          .toList();

      await Share.shareFiles(widget.urlImages,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }
}
