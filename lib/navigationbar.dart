
import 'dart:collection';

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_look/Banner_user_side.dart';
import 'package:insta_look/add_photos.dart';
import 'package:insta_look/add_third_row.dart';
import 'package:insta_look/authentications/profile.dart';
import 'package:insta_look/linked_account.dart';
import 'package:insta_look/post_page.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:math';
import 'dart:typed_data';

import 'linkinstagram.dart';
import 'models/album.dart';


class Navigatiobar extends StatefulWidget {
  
  
  const Navigatiobar({Key? key, }) : super(key: key);

  @override
  _NavigatiobarState createState() => _NavigatiobarState();
}

class _NavigatiobarState extends State<Navigatiobar> {


  
  @override


  void scheduleRebuild() => setState(() {});
  @override
  
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTabScaffold(
       // backgroundColor: Colors.transparent,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => thirdRow (),);   /// linkinstagram
          case 1:
             return CupertinoTabView(builder: (context) =>AddPhoto() );// PreviewDart (urlImages: [],),
          case 2:
             return CupertinoTabView(builder: (context) =>  PreviewDart (urlImages: [],),);
          case 3:
            return CupertinoTabView(builder: (context) =>  IssueListApi());
             case 4:
            return CupertinoTabView(builder: (context) =>  filters (),);
             case 5:
            return CupertinoTabView(builder: (context) =>  Profile (),);
    
          default:
            return CupertinoTabView(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              ),
            );
        }
      },
    
      // tabBar: InvisibleCupertinoTabBar(),
      tabBar: CupertinoTabBar(
        inactiveColor: Colors.white,
        activeColor: Colors.blue,
        backgroundColor: Colors.black,
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
           BottomNavigationBarItem(
            label: 'Add photo',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Perview', 
            icon: Icon(Icons.remove_red_eye),
          ),
        
          BottomNavigationBarItem(
            label: 'Setting',
            icon: Icon(Icons.settings),
          ),
           BottomNavigationBarItem(
            label: 'Filter',
            icon: Icon(Icons.filter_1_outlined),
          ),
         
            BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person),
          ),
          
        ],
         onTap: (value) {
        if (value == 0) {

           setState(() {
            //  print("my logic");
            //   Navigator.of(context).push(MaterialPageRoute(
            //                   builder: (context) =>  thirdRow(
                                  
            //                       )
            //                       ));
                        
           }
           );







        };
        if (value == 1) {
           setState(() {
            //    print("load assests");
            // loadAssets();
            
          
           });
        };
        if (value == 2)  { 
            setState(() {
                     
                    });
                                };
        if (value == 3) ("two");
        if (value == 4) ("two");
        
      },
      ),
      ),
    );
  }
   
   
  
}
