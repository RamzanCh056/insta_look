import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_look/Home_page.dart';

import 'package:insta_look/authentications/loginotp.dart';
import 'package:insta_look/login.dart';


class HomePageCall extends StatefulWidget {
  const HomePageCall({ Key? key }) : super(key: key);

  @override
  _HomePageCallState createState() => _HomePageCallState();
}

class _HomePageCallState extends State<HomePageCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(73, 85, 83, 83),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Column(



            children: [

              SizedBox(height: 90,),
             Column(children: [
                 Container(
                               height: 100,
                              width: 140,
                               
                                child: Image(image: AssetImage('images/insta Look.png')),
                             ),
              //  Text(
              //          'Inasta look',
              //         style: GoogleFonts.pacifico(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 27,),  )
              //        ),
             ],),
               SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text(
                    'Welcome',
                    style:
                     TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),

                  ),




                ],),
              SizedBox(height: 60,),

              Column(

                children: [

                  Column(
                    children: [
                      MaterialButton(
                        color: Colors.white,
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>   Login(),));// signup
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Admin',
                          style:
                          TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),

                        ),
                        // child: Text(
                        //   "Client",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18,color: Colors.black,
                        //   ),

                        // ),
                      ),
                    ],
                  ),




                ],),
              SizedBox(height: 20,),

              Column(
                children: [
                  MaterialButton(
                    color: Colors.white,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => otp()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Users',
                      style:
                         TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),





            ],),
        ),
      ),





    );
  }
}