import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_look/Home_page.dart';
import 'package:insta_look/add_third_row.dart';
import 'package:insta_look/navigationbar.dart';
import 'package:insta_look/small_navigation.dart';
class youraccount extends StatefulWidget {
  const youraccount({ Key? key }) : super(key: key);

  @override
  _youraccountState createState() => _youraccountState();
}

class _youraccountState extends State<youraccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(241, 1, 23, 34).withOpacity(0.5),

      body: SafeArea(child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 40,),
             
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
               Text(
                 'Inasta look',
                style: GoogleFonts.pacifico(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),  )
               ),
      
           ],),
             SizedBox(height: 40,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
               Text(
                 'Your Account',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),  )
               ),
      
           ],),
           SizedBox(height: 30,),
      
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(children: [
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
      
                          Container(   
                  height: 170.0,
                  width: 170,
                  child: Card(
                       shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(14),
        ),
              
                    child: Container(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // SizedBox(height: 3,),
                          InkWell(
                            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MainBottomClass()));

                            },
                            child: ClipRRect(
                               
                                           borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  
                                    
                              child: Image.asset('images/aesthen.jpg' , fit: BoxFit.fill, height: 118,)),
                          ),
                          SizedBox(height: 14.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 16.0,),
                              Text('Add account', style: TextStyle(color: Colors.black,fontSize: 16, ), ),
                           
                            ],
                          ),
                          SizedBox(height: 10.0,),
                        ],
                   ),
                  ),
                    )
                  ),
        //              Container(   
        //         height: 170.0,
        //         width: 170,
        //         child: Card(
        //              shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.white70, width: 1),
        //   borderRadius: BorderRadius.circular(14),
        // ),
              
        //           child: Container(
                      
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 // SizedBox(height: 3,),
        //                 ClipRRect(
                             
        //                                borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(10.0),
        //     topLeft: Radius.circular(10.0)),
        
          
        //                   child: Image.asset('images/cupcofe.jpg' , fit: BoxFit.fill, height: 118,)),
        //                 SizedBox(height: 14.0,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: <Widget>[
        //                     SizedBox(width: 16.0,),
        //                     Text('Minimallife', style: TextStyle(color: Colors.black,fontSize: 16, ), ),
                           
        //                   ],
        //                 ),
        //                 SizedBox(height: 10.0,),
        //               ],
        //          ),
        //         ),
        //           )
        //         ),
      
      
      
      
      
      
      
                    ],),
      
      
      SizedBox(height: 10,),
      
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
        //             children: [
        //                 Container(   
        //         height: 170.0,
        //         width: 170,
        //         child: Card(
        //              shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.white70, width: 1),
        //   borderRadius: BorderRadius.circular(14),
        // ),
              
        //           child: Container(
                      
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 // SizedBox(height: 3,),
        //                 ClipRRect(
                             
        //                                borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(10.0),
        //     topLeft: Radius.circular(10.0)),
        
          
        //                   child: Image.asset('images/fashion.jpg' , fit: BoxFit.fill, height: 118,)),
        //                 SizedBox(height: 14.0,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: <Widget>[
        //                     SizedBox(width: 16.0,),
        //                     Text('Fashionstr', style: TextStyle(color: Colors.black,fontSize: 16, ), ),
                           
        //                   ],
        //                 ),
        //                 SizedBox(height: 10.0,),
        //               ],
        //          ),
        //         ),
        //           )
        //         ),
        //               Container(   
        //         height: 170.0,
        //         width: 170,
        //         child: Card(
        //              shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.white70, width: 1),
        //   borderRadius: BorderRadius.circular(14),
        // ),
              
        //           child: Container(
                      
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 // SizedBox(height: 3,),
        //                 ClipRRect(
                             
        //                                borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(10.0),
        //     topLeft: Radius.circular(10.0)),
        
          
        //                   child: Image.asset('images/landscape.jpg' , fit: BoxFit.fill, height: 118,)),
        //                 SizedBox(height: 14.0,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: <Widget>[
        //                     SizedBox(width: 16.0,),
        //                     Text('landscapes', style: TextStyle(color: Colors.black,fontSize: 16, ), ),
                           
        //                   ],
        //                 ),
        //                 SizedBox(height: 10.0,),
        //               ],
        //          ),
        //         ),
        //           )
        //         ),
      
      
      
        //           ],),
      
        //           Row(children: [
        //   SizedBox(width: 20,),
      
        //                Container(   
        //         height: 170.0,
        //         width: 170,
        //         child: Card(
        //              shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.white70, width: 1),
        //   borderRadius: BorderRadius.circular(14),
        // ),
              
        //           child: Container(
                      
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 // SizedBox(height: 3,),
        //          Container(
        //            color: Colors.black,
        //            height: 110,
        //            width: 170,
        //            child: Row(children: [
        //                 Center(
        //                   child: Container(
        //                    // color: Colors.green,
        //                     // height: 20,
        //                     // width: 20,

        //                     child:   Row(
                              
        //                       children: [
        //                         SizedBox(width: 60,),
        //                         Icon(Icons.add_rounded, color: Colors.white,),
        //                       ],
        //                     ),
        //                   ),
        //                 ),

        //            ],),
        //          ),
        //                 SizedBox(height: 20.0,),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: <Widget>[
        //                     SizedBox(width: 16.0,),
        //                     Text('Add Account', style: TextStyle(color: Colors.black,fontSize: 16, ), ),
                           
        //                   ],
        //                 ),
        //                 SizedBox(height: 10.0,),
        //               ],
        //          ),
        //         ),
        //           )
        //         ),
              
        //           ],),
        // SizedBox(height: 20,),
      
      
      
      
      
                  ],),
                )
      
               
      
      
        ],),
      ),),
      
    );
  }
}