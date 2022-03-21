import 'package:flutter/material.dart';
import 'package:insta_look/upgradeto-pro.dart';

import 'Banner_user_side.dart';
class LinkedAccount extends StatefulWidget {
  const LinkedAccount({ Key? key }) : super(key: key);

  @override
  _LinkedAccountState createState() => _LinkedAccountState();
}

class _LinkedAccountState extends State<LinkedAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(244, 2, 23, 34),
       backgroundColor: Color.fromARGB(241, 1, 23, 34),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [


                Container(
               // color: Colors.black,
                  height: 30,
                  width: 30,
                   decoration: BoxDecoration(
    border: Border.all(
        width: 2.0,
        color: Colors.white,
    ),
    borderRadius: BorderRadius.all(
          Radius.circular(18.0) , 
    ),
  ),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              SizedBox(width: 5,),
              GestureDetector(
               // onTap: (){ Navigator.pop(context, );},
                
                child: Icon(Icons.arrow_back_ios , color: Colors.white,  size: 16,)),
            ],
          ),
            
            
              ),
              ],)
            ),
            SizedBox(height: 70,),

          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [


               Text("LINKED ACCOUNT", style: TextStyle(color: Colors.white, fontSize: 18),)

            ],),


            Column(
           
              children: [
              ListTile(title: Text("No Acccount Added", style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          
            trailing: Icon(Icons.add_circle_outline, color: Colors.white,)
          ),
          Divider(thickness: 2,
          color: Colors.grey,),
          ListTile(title: Text("Remove Account", style: TextStyle(color: Colors.white, fontSize: 18),),
           
          ),
          Divider(thickness: 2,
          color: Colors.grey,
          ),
            ListTile(title: Text("UPGRADE TO PRO", style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
            onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>  UserSideBaneeer()));},
          ),
          Divider(thickness: 2 , color: Colors.grey,),
  

            ],)



        ],),
      ),
      
    );
  }
}