import 'package:flutter/material.dart';
import 'package:insta_look/upgradeto-pro.dart';
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


  //               Container(
  //              // color: Colors.black,
  //                 height: 30,
  //                 width: 30,
  //                  decoration: BoxDecoration(
  //   border: Border.all(
  //       width: 2.0,
  //       color: Colors.white,
  //   ),
  //   borderRadius: BorderRadius.all(
  //         Radius.circular(18.0) , 
  //   ),
  // ),

  //       child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
            
  //           children: [
  //             SizedBox(width: 5,),
  //             GestureDetector(
  //              // onTap: (){ Navigator.pop(context, );},
                
  //               child: Icon(Icons.arrow_back_ios , color: Colors.white,  size: 16,)),
  //           ],
  //         ),
            
            
  //             ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Upgradetopro ()));
            },
          ),
          Divider(thickness: 2,
          color: Colors.grey,
          ),
            ListTile(title: Text("Change text on login screen", style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onTap: (){ 
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> Upgradetopro ()));
            },
          ),
            Divider(thickness: 2,
          color: Colors.grey,
          ),
            ListTile(title: Text("Change pic on login screen", style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
            onTap: (){ 
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> Upgradetopro ()));
            },
          ),
          Divider(thickness: 2 , color: Colors.grey,),
  

            ],)



        ],),
      ),
      
      
    );
  }
}