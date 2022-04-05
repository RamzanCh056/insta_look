import 'package:flutter/material.dart';
import 'package:insta_look/example.dart';
import 'package:insta_look/upgradeto-pro.dart';

import 'Home_page.dart';
import 'change_home_screen_text.dart';
class Add extends StatefulWidget {
  const Add({ Key? key }) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Color.fromARGB(241, 1, 23, 34),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [


              ],)
            ),
            SizedBox(height: 70,),

          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [


               Text("Advertisement", style: TextStyle(color: Colors.black, fontSize: 18),),

            ],),
            SizedBox(height: 20,),


            Column(
           
              children: [
          
          ListTile(title: Text("Add advertisment banner", style: TextStyle(color: Colors.black, fontSize: 18),),
               trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                onTap: (){ 
              Navigator.push(context, MaterialPageRoute(builder: (context)=>   ImageUpload ()));   // Upgradetopro
            },
          ),   
          Divider(thickness: 2,
          color: Colors.grey,
          ),
            ListTile(title: Text("Change text on login screen", style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onTap: (){ 
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeHomescreen ()));
            },
          ),
            Divider(thickness: 2,
          color: Colors.grey,
          ),
            ListTile(title: Text("Change pic on login screen", style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onTap: (){ 
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage ()));
            },
          ),
          Divider(thickness: 2 , color: Colors.grey,),
  

            ],),



        ],),
      ),
      
      
    );
  }
}