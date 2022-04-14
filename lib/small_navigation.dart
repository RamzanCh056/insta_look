
import 'package:flutter/material.dart';
import 'package:insta_look/Banner_user_side.dart';
import 'package:insta_look/add_photos.dart';
import 'package:insta_look/add_third_row.dart';
import 'package:insta_look/authentications/profile.dart';
import 'package:insta_look/models/album.dart';
import 'package:insta_look/post_page.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();
}

class _MainBottomClassState extends State<MainBottomClass> {
  int selectedIndex = 0;

  //list of widgets to call ontap
  final widgetOptions = [
    new thirdRow(),
    new AddPhoto(),
    new PreviewDart (urlImages: [],),
    new IssueListApi(),
    new filters(),
    new Profile(),

  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "Add photo", "perview, setting , filter, profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red,
     
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
       
                  fixedColor: Colors.white,
              
                //unselectedItemColor: Colors.white,
               
              
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,),
          ),
           BottomNavigationBarItem(
            label: 'Add photo',
            icon: Icon(Icons.add,),
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
        currentIndex: selectedIndex,
      //  fixedColor: Colors.blue,
        onTap: onItemTapped,
         
        // selectedItemColor: Colors.blue,
      //    selectedLabelStyle: TextStyle(color: Colors.blue, fontSize: 20),
      //   unselectedFontSize: 16,
        selectedIconTheme:
           IconThemeData(color: Colors.blue, ),
       unselectedItemColor: Colors.white,
         unselectedLabelStyle: TextStyle( color: Colors.white),
      ),
    );
  }
}