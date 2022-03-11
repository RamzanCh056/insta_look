import 'package:flutter/material.dart';
class SubscriptionAllowAdmin extends StatefulWidget {
  const SubscriptionAllowAdmin({ Key? key }) : super(key: key);

  @override
  State<SubscriptionAllowAdmin> createState() => _SubscriptionAllowAdminState();
}

class _SubscriptionAllowAdminState extends State<SubscriptionAllowAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
    title: Text('Subscribers'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  ),
      body: SafeArea(
        
        child: Column(
          
          children: [SizedBox(height: 60,),
      
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                 Container(
                   child: Card(
                     
                     child: Row(children: [

                       CircleAvatar(
                         radius: 30.0,
                         backgroundImage:
                         AssetImage('images/aplly.jpg'),
                       //  backgroundColor: Colors.indigo,
                       ),
                         SizedBox(width: 4,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           
                           children: [
                        Row(
                          children: [
                            Text(" Angile want to subscribe insta look ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      
                              SizedBox(height: 6,),
                           Text(" Aed 9.99/5 picture pakage", style: TextStyle(fontSize: 14,color: Colors.grey),),
                           SizedBox(height: 15,),
                        
                        Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.blueAccent[200],
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Accept   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
                           Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.redAccent,
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Decline   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
        
                        ],)
        
                        ],),
                        
        
                         ],),
                        
                   
                     ],),
                   ),
                 ),
        
        
                  ],),
                  SizedBox(height: 10,),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                 Container(
                   child: Card(
                     
                     child: Row(children: [

                       CircleAvatar(
                         radius: 30.0,
                         backgroundImage:
                         AssetImage('images/david.jpg'),
                       //  backgroundColor: Colors.indigo,
                       ),
                         SizedBox(width: 4,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           
                           children: [
                        Row(
                          children: [
                            Text(" david want to subscribe insta look ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      
                              SizedBox(height: 6,),
                           Text(" Aed 22.50/22 picture pakage", style: TextStyle(fontSize: 14,color: Colors.grey),),
                           SizedBox(height: 15,),
                        
                        Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.blueAccent[200],
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Accept   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
                           Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.redAccent,
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Decline   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
        
                        ],)
        
                        ],),
                        
        
                         ],),
                        
                   
                     ],),
                   ),
                 ),
        
        
                  ],),
                   SizedBox(height: 10,),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                 Container(
                   child: Card(
                     
                     child: Row(children: [

                       CircleAvatar(
                         radius: 30.0,
                         backgroundImage:
                         AssetImage('images/chiara.jpg'),
                       //  backgroundColor: Colors.indigo,
                       ),
                         SizedBox(width: 4,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           
                           children: [
                        Row(
                          children: [
                            Text(" chiara want to subscribe insta look ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      
                              SizedBox(height: 6,),
                           Text(" Aed 48.50/ Unlimited pakage", style: TextStyle(fontSize: 14,color: Colors.grey),),
                           SizedBox(height: 15,),
                        
                        Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.blueAccent[200],
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Accept   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
                           Row(children: [
                          SizedBox(width: 40,),
                       MaterialButton(
                      color: Colors.redAccent,
                      minWidth: 40,
                     
                      height: 32,
                      onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileView ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Decline   ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,color: Colors.white,
                        ),
        
                      ),
                    ),
        
                        ],)
        
                        ],),
                        
        
                         ],),
                        
                   
                     ],),
                   ),
                 ),
        
        
                  ],),


      
          
        ],),
      ),
      
    );
  }
}