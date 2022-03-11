
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/linked_account.dart';
import 'package:insta_look/post_page.dart';

import 'linkinstagram.dart';

class Navigatiobar extends StatefulWidget {
  const Navigatiobar({Key? key}) : super(key: key);

  @override
  _NavigatiobarState createState() => _NavigatiobarState();
}

class _NavigatiobarState extends State<Navigatiobar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTabScaffold(
       // backgroundColor: Colors.transparent,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) =>  linkinstagram(),);
          case 1:
            return CupertinoTabView(builder: (context) =>  Container(child: Text("onetwo"),));
          case 2:
            return CupertinoTabView(builder: (context) => Container(child: Text("one"),));
          case 3:
            return CupertinoTabView(builder: (context) =>   PostPge());
             case 4:
            return CupertinoTabView(builder: (context) =>  LinkedAccount (),);
    
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
            label: 'Add layout', 
            icon: Icon(Icons.qr_code),
          ),
          BottomNavigationBarItem(
            label: 'Add photo',
            icon: Icon(Icons.add_circle_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Perview',
            icon: Icon(Icons.remove_red_eye),
          ),
            BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      ),
    );
  }

}
