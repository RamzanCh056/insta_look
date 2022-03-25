import 'package:flutter/material.dart';
import 'package:insta_look/main.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:insta_look/small_navigation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';

class thirdRow extends StatelessWidget {
  const thirdRow({Key? key}) : super(key: key);

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
  Asset? imageSource;
  bool? isSelected;
  int? index;

  MyImages(Asset? ImageSource, bool? IsSelected, int? Index) {
    imageSource = ImageSource;
    isSelected = IsSelected;
    index = Index;
  }
}

class _MyAppState extends State<MyApp> {
  final controller = DragSelectGridViewController();

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

  HashSet selectItems = HashSet();
  PickedFile? _imagefile;
  bool isMultiSelectionEnabled = false;
  List<Asset> images = <Asset>[];

  List<MyImages> MyimagesList = <MyImages>[];

  String _error = 'No Error Dectected';

  Widget builderGrid() {
    return DragSelectGridView(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4, crossAxisCount: 3, mainAxisSpacing: 4),
        itemBuilder: (context, index, isSelected) {
          // gallery = images[index] as File;
          // _imagefile = images[index] as PickedFile;
          // Asset asset = images[index];
          if (isSelected) {
            if (MyimagesList.isNotEmpty &&
                MyimagesList.where((element) => element.index == index)
                        .length ==
                    0) {
              MyimagesList.add(new MyImages(images[index], isSelected, index));
            } else if (MyimagesList.isEmpty) {
              MyimagesList.add(new MyImages(images[index], isSelected, index));
            }
          } else if (images != null && !isSelected) {
            //MyimagesList.remove(value);
          }
          return
              // AssetThumb(asset: images[index], width: 100, height: 100);
              SelectableItemWidget(url: images[index], IsSelected: isSelected);
        });

    // GridView.builder(
    //     itemCount: images.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3, crossAxisSpacing: 3),
    //     itemBuilder: (context, index) {
    //       Asset asset = images[index];
    //       return AssetThumb(
    //         asset: asset,
    //         height: 300,
    //         width: 30,
    //       );
    //     });
  }

  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     crossAxisSpacing: 4,
  //     children: List.generate(images.length, (index) {
  //      // Asset asset = images[index];
  //       //  print('path $asset');
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

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
          actionBarColor: "#abcdef", 
          actionBarTitle: "insta look",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSelect = controller.value.isSelecting;
    final text = isSelect
        ? '${controller.value.amount} Images Selected'
        : Text('Images');
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
    title: Text('aestheticpie'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  ),
      body: Column(
        children: <Widget>[
          Center(child: Text('Error: $_error')),
           Padding(
             padding: const EdgeInsets.only( left: 90,right: 90),
             child: MaterialButton(
                    //  color: Colors.white,
                      minWidth: 30,
                      height: 50,
                      
                      onPressed:
                      loadAssets,
                      
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                      
             Icon(Icons.add_circle_rounded, color: Colors.black, ),
                SizedBox(width: 10,),
                Text(
                 "Add a Row",
                 style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18,color: Colors.black,
                 ),
  
               ),
               ],),
                    ),
           ),
           SizedBox(height: 15,),
          
          
          // ElevatedButton(
          //   child: Text("Pick images"),
          //   onPressed: loadAssets,
          // ),
          Expanded(
            child: builderGrid(),
          ),
          ElevatedButton(
            child: Text("Swap"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyNewApp ()));
              Asset Item1 = images
                  .where((element) => element == MyimagesList.first.imageSource)
                  .single;

              int Item1Index = images.indexOf(Item1);
              Asset Item2 = images
                  .where((element) => element == MyimagesList.last.imageSource)
                  .single;
              int Item2Index = images.indexOf(Item2);

              var tmp = images[Item1Index];
              images[Item1Index] = images[Item2Index];
              images[Item2Index] = tmp;
            },
          ),
        ],
      ),
    );
  }

  String getSelectedItemCount() {
    return selectItems.isNotEmpty
        ? selectItems.length.toString() + " item selected"
        : "No item selected";
  }
}

class SelectableItemWidget extends StatefulWidget {
  final Asset url;
  // List images;

  // AssetThumb aset;
  final bool IsSelected;
  SelectableItemWidget({Key? key, required this.url, required this.IsSelected})
      : super(key: key);
  // SelectableItemWidget({Key? key}) : super(key: key);

  @override
  State<SelectableItemWidget> createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(widget.IsSelected ? 90 : 20),
        child: AssetThumb(
          asset: widget.url,
          width: 300,
          height: 300,
        )
        // Image.asset(
        //   widget.url.identifier.toString(),
        //   fit: BoxFit.fill,
        // )
        //  Image.file(
        //   widget.url,
        //   fit: BoxFit.cover,
        // )
        );
  }
}


// class thirdRow extends StatefulWidget {
//   const thirdRow({ Key? key }) : super(key: key);

//   @override
//   _thirdRowState createState() => _thirdRowState();
// }

// class _thirdRowState extends State<thirdRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:   AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.black,
//     title: Text('aestheticpie'),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         bottom: Radius.circular(30),
//       ),
//     ),
//   ),


//   body: SingleChildScrollView(
//     child: Column(children: [
  
//       SizedBox(height: 30,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MaterialButton(
//                   //  color: Colors.white,
//                     minWidth: 30,
//                     height: 50,
                    
//                     onPressed: (){
//                     // Navigator.push(context, MaterialPageRoute(builder: (context)=> viewjob ()));// signup
//                     },
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         color: Colors.black,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child:  Row(mainAxisAlignment: MainAxisAlignment.center,
//                children: [
                    
//            Icon(Icons.add_circle_rounded, color: Colors.black, ),
//               SizedBox(width: 10,),
//               Text(
//                "Add a Row",
//                style: TextStyle(
//                  fontWeight: FontWeight.w600,
//                  fontSize: 18,color: Colors.black,
//                ),
  
//              ),
//              ],),
//                   ),
                
               
                
                
                
//                 ],
//               ),
//               SizedBox(height: 40,),
//               Column(children: [
//                   GestureDetector(
//                     onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>MyNewApp ()));},
//                     child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                                  Container(
//                      color: Colors.grey,
//                      height: 118,
//                                    width: 133,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                                    Icon(Icons.add_circle_rounded , color: Colors.white,),
//                      ],),
                     
                    
                    
//                                  ),
//                                    Row(children: [
//                                  Container(
//                      color: Colors.grey,
//                      height: 118,
//                                    width: 133,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                                    Icon(Icons.add_circle_rounded , color: Colors.white,),
//                      ],),
                    
                    
//                                  ),
                                 
                    
                    
//                                   ],),
//                     Row(children: [
//                                  Container(
//                      color: Colors.grey,
//                      height: 118,
//                                 width: 133,
//                                    child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                                    Icon(Icons.add_circle_rounded , color: Colors.white,),
//                      ],),
                    
                    
//                                  ),
                                 
                    
                    
//                                   ],),
                                 
                    
                    
//                                   ],),
//                   ),
  
  
//                 SizedBox(height: 10,),

//                   Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
                   
  
  
//                ),
//                  Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
  
  
//                ),
               
  
  
//                 ],),
//                   Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                  child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
  
  
//                ),
               
  
  
//                 ],),
               
  
  
//                 ],),
//                 SizedBox(height: 10,),
                
//                   Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
                   
  
  
//                ),
//                  Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
  
  
//                ),
               
  
  
//                 ],),
//                   Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                  child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                  Icon(Icons.add_circle_rounded , color: Colors.white,),
//                    ],),
  
  
//                ),
               
  
  
//                 ],),
               
  
  
//                 ],),
//                 SizedBox(height: 10,),
  
  
//                 Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                GestureDetector(
//                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>MyNewApp ()));},
//                  child: Container(
//                      color: Colors.grey,
//                      height: 118,
//                      width: 133,
//                       child: Image.network('https://oasis.opstatics.com/content/dam/oasis/page/2021/operation/1217/homepage/mo/02-OnePlus-9.jpg' , fit: BoxFit.fill, )
                 
                 
//                  ),
//                ),
//                  Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
//                   Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                   width: 133,
//                     child: Image.network('https://st3.depositphotos.com/3047333/12924/i/600/depositphotos_129246006-stock-photo-kitten-sitting-in-flowers.jpg' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
               
  
  
//                 ],),
  
//   SizedBox(height: 10,),
  
//                    Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://media.istockphoto.com/photos/snowy-peaks-of-the-caucasus-mountains-picture-id1327243304?b=1&k=20&m=1327243304&s=170667a&w=0&h=eVHzfEbMv7ki-LY0p-KO4L7X19KaqMYe2GmfPwcrGjU=' , fit: BoxFit.fill, )
  
  
//                ),
//                  Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
//                   Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://images.pexels.com/photos/40784/drops-of-water-water-nature-liquid-40784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
               
  
  
//                 ],),
  
//                 SizedBox(height: 10,),
  
//                    Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://site.tre-altamira.com/wp-content/uploads/2018/06/earth_zoom-1440x901.jpg' , fit: BoxFit.fill, )
  
  
//                ),
//                  Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                    width: 133,
//                     child: Image.network('https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171__480.jpg' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
//                   Row(children: [
//                Container(
//                    color: Colors.grey,
//                    height: 118,
//                     width: 133,
//                     child: Image.network('https://images.pexels.com/photos/40784/drops-of-water-water-nature-liquid-40784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' , fit: BoxFit.fill, )
  
  
//                ),
               
  
  
//                 ],),
               
  
  
//                 ],),
//                 SizedBox(height: 15,),
               
                
                
  
  
  
//               ],)
  
  
  
  
  
  
//     ],),
//   ),
//     );
//   }
// }