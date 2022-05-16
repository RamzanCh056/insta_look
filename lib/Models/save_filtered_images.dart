import 'dart:io';

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/models/crope_n.dart';
import 'package:insta_look/models/save_caroseul.dart';

class FilteredImages extends StatefulWidget {
  const FilteredImages({Key? key}) : super(key: key);

  @override
  State<FilteredImages> createState() => _FilteredImagesState();
}

class _FilteredImagesState extends State<FilteredImages> {
  int _selectedIndex = 0;
  final controller = DragSelectGridViewController();

  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  Widget builderGrid() {
    return DragSelectGridView(
        gridController: controller,
        itemCount: savedImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, crossAxisCount: 3, mainAxisSpacing: 8),
        itemBuilder: (context, index, isSelected) {
          // if (!isSelected) {
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

          // AssetThumb(asset: images[index], width: 100, height: 100);
          // SelectableItemWidget(url: images[index], IsSelected: isSelected);
        });
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  void scheduleRebuild() => setState(() {});

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
        body: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: builderGrid(),
            ),
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
                    icon: Icon(Icons.home),
                    label: 'Home',
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
                    setState(() {});
                  }
                  ;
                  if (value == 1) {
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
            )));
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
        child:
            // Positioned(
            Container(
                decoration: BoxDecoration(
                    border: widget.IsSelected
                        ? Border.all(width: 2, color: Colors.black)
                        : Border.all(width: 0)),
                child: widget.IsSelected
                    ? Stack(children: [
                        Positioned(
                          child: Image.file(
                            File(widget.url.toString()).absolute,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 95,
                            right: 0,
                            child: Icon(
                              Icons.done_outline_rounded,
                              color: Colors.black,
                            )),
                      ])
                    : Container()),
        // ),
      ),
    );
  }
}
