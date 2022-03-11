import 'package:flutter/material.dart';
import 'package:insta_look/add_advertise_admin.dart';
import 'package:insta_look/add_third_row.dart';
import 'package:insta_look/subscription_allow_admin.dart';




class Adminbottom extends StatelessWidget {
  const Adminbottom ({Key? key}) : super(key: key);

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
    SubscriptionAllowAdmin(),
     Add(),
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
        
         borderRadius: BorderRadius.only(topLeft: Radius.circular(14.0), topRight: Radius.circular(22.0), bottomLeft: Radius.circular(14.0),bottomRight: Radius.circular(22.0),   ),
        child: BottomNavigationBar(
          
           //elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
         
          items: const <BottomNavigationBarItem>[
              
        
            BottomNavigationBarItem(
              
              icon: Icon(Icons.subscriptions,  ),
              label:  ("subscription"),  
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'add', 
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
