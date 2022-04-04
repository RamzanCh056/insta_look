import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/add_third_row.dart';




class MyNewApp extends StatelessWidget {
  const MyNewApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,

      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    thirdRow(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    // Carasolnavigation (),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        
         borderRadius: BorderRadius.only(topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0), bottomLeft: Radius.circular(22.0),bottomRight: Radius.circular(22.0),   ),
        child: BottomNavigationBar(
          
           //elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
         
          items: const <BottomNavigationBarItem>[
              
        
            BottomNavigationBarItem(
              
              icon: Icon(Icons.add_circle_outline ,  ),
              label:  ("Add"),  
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
          
          
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  
}
