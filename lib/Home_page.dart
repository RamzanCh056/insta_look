import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_look/skip.dart';
import 'package:insta_look/your_acount.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // backgroundColor: Color.fromARGB(241, 1, 23, 34).withOpacity(0.5),
      
    //backgroundColor: Color(0x121929),
     
      
      body:   Stack(
        children: [
       Column(
          
            children: [
              SizedBox(height: 20,),
      
               Column(children: [
                Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
               Container(
                //  color: Colors.grey,
                  
                   height: 118,
                 width: 137,
                 
                    child: Image.asset('images/picone.png' , fit: BoxFit.fill, 
                    
                    // color: const Color.fromRGBO(255, 255, 255, 0.5, ),
                    // colorBlendMode: BlendMode.modulate
                    
                    )
      
      
               ),
                 Row(children: [
               Container(
                 color: Colors.grey,
                   height: 118,
                   width: 137,
                    child: Image.asset('images/secondpic.png' , fit: BoxFit.fill,
                       color: const Color.fromRGBO(255, 255, 255, 0.5, ),
                    colorBlendMode: BlendMode.modulate
                     )
      
      
               ),
               
      
      
                ],),
                  Row(children: [
               Container(
                 color: Colors.grey,
                   height: 118,
                width: 137,
                    child: Image.asset('images/thirdpic.png' , fit: BoxFit.fill, 
                       color: const Color.fromRGBO(255, 255, 255, 0.5, ),
                    colorBlendMode: BlendMode.modulate
                    )
      
      
               ),
               
      
      
                ],),
               
      
      
                ],),
       Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
               Container(
                 color: Colors.grey,
                 
                   height: 118,
                 width: 137,
                 
                    child: Image.asset('images/forth.png' , fit: BoxFit.fill, 
                    
                  color: Color.fromARGB(160, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    
                    )
      
      
               ),
                 Row(children: [
               Container(
                  color: Colors.grey,
                   height: 118,
                  width: 137,
                    child: Image.asset('images/fifth.png' , fit: BoxFit.fill,
                       color: Color.fromARGB(160, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    
                     )
      
      
               ),
               
      
      
                ],),
                  Row(children: [
               Container(
                 color: Colors.grey,
                   height: 118,
                width: 137,
                    child: Image.asset('images/six.png' , fit: BoxFit.fill,
                        color: Color.fromARGB(160, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    )
      
      
               ),
               
      
      
                ],),
               
      
      
                ],),

      
      
             
       Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
               Container(
                 color: Colors.grey,
                   height: 118,
                  width: 137,
                 
                    child: Image.asset('images/seven.png' , fit: BoxFit.fill, 
                   color: Color.fromARGB(103, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    
                    )
      
      
               ),
                 Row(children: [
               Container(
                    color: Colors.grey,
                   height: 118,
                   width: 137,
                    child: Image.asset('images/eight.png' , fit: BoxFit.fill, 
                        color: Color.fromARGB(103, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    
                    )
      
      
               ),
               
      
      
                ],),
                  Row(children: [
               Container(
                   color: Colors.grey,
                 
                   height: 118,
                width: 136,
                    child: Image.asset('images/ninth.png' , fit: BoxFit.fill, 
                       color: Color.fromARGB(103, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate
                    
                    )
      
      
               ),
               
      
      
                ],),
               
      
      
                ],),
               
                
                
      
      
      
              ],),
            
      
        // Positioned(
        //   bottom: 80,
        //   left: 0,
        //   right: 0,
        //   child:
        // ),
      
            ]),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              
              child: Container(
                  height: 680,
                  
                 // color: 

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color.fromARGB(167, 220, 218, 226).withOpacity(0.1),
            Color.fromARGB(255, 233, 230, 236).withOpacity(0.1),
            Color.fromARGB(255, 9, 1, 31).withOpacity(0.9),
            Color.fromARGB(255, 3, 0, 10).withOpacity(0.9),
            Color.fromARGB(255, 6, 1, 20).withOpacity(0.9),
          ],
        stops: [0.0,0.25,0.5,0.75,1.0]
        ),
      ),
    
child:  Container(
           
          
           //color: Color(0x121929),
            child: Column(
            
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               
                Column(children: [
              SizedBox(height: 250,),
                   Text(
                     'Inasta look',
                    style: GoogleFonts.pacifico(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),  )
                   ),
              
               ],),
               SizedBox(height: 40,),
                 Column(children: [
                   Text(
                     'Organize your instagram content\neassily', 
                     style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),  )
                   ),
              
               ],),
              
              
                 SizedBox(height: 100),
                 
                 Padding(
                   padding: const EdgeInsets.only(left: 35,right: 35),
                   child: MaterialButton(
                   color: Colors.white,
                   minWidth: double.infinity,
                   height: 50,
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> youraccount ()));// signup
                   },
                   shape: RoundedRectangleBorder(
                     side: BorderSide(
                       color: Colors.white,
                     ),
                      borderRadius: BorderRadius.circular(10),
                   ),
                   
                   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                          
                IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(FontAwesomeIcons.instagram), 
            onPressed: () { print("Pressed"); }
             ),
                    SizedBox(width: 10,),
                    Text(
                     "Login with instagram",
                     style: TextStyle(
                       fontWeight: FontWeight.w600,
                       fontSize: 18,color: Colors.black,
                     ),
              
                   ),
              
                   
              
                   ],),
                   
              
              
                   ),
                 ),
                 SizedBox(height: 17,),
                 GestureDetector(
                   onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Skip ()));},
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Skip',
                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22, decoration: TextDecoration.underline),
                     ),
                             
                   ],
                   ),
                 ),
              
              
             ],
              
             ),
          ),


            ))
        ],

      ),
    );
  }
}