import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_look/stripe.dart';
class Upgradetopro extends StatefulWidget {
  const Upgradetopro({ Key? key }) : super(key: key);

  @override
  _UpgradetoproState createState() => _UpgradetoproState();
}

class _UpgradetoproState extends State<Upgradetopro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 0, 0, 0),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
             Row(children: [
               Row(children: [

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
                onTap: (){ Navigator.pop(context, );},
                
                child: Icon(Icons.arrow_back_ios , color: Colors.white,  size: 16,)),
            ],
          ),
              
              
                ),


               ],),
                
SizedBox(width: 107,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 
                 children: [

                 
               Text(
                 'Inasta look',
                style: GoogleFonts.pacifico(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20,),  )
               ),


               ],)


             ],),

             SizedBox(height: 50,),
             Container(
             height: 200,
             width: double.infinity,
             color:  Color.fromARGB(176, 4, 49, 73),
              child: Row(
               children: [
                    Image.asset('images/advertice.png' , fit: BoxFit.fill, 
                  
                  )
                      

               ],
             )
             ),
             SizedBox(height: 15,),
             
               Column(children: [
              Row(children: [
                
                Icon(Icons.done, color: Colors.green,),
              Text("Giving you the best look of your insta page",style: TextStyle(color: Colors.white, fontSize: 15,),),

             



              ],),
              Row(children: [
                
                Icon(Icons.done, color: Colors.green,),
              Text("Providing layouts that manage the poor",style: TextStyle(color: Colors.white, fontSize: 15,),),

             



              ],),
              ListTile(
                 leading: Icon(Icons.circle_outlined, color: Colors.white,),
                 title:   Text("Aed 9.99/5 pictures Pakage",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),




              ),
               ListTile(
                 leading: Icon(Icons.circle_outlined, color: Colors.white,),
                 title:   Text("Aed 22.50/ pictures Pakage",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),




              ),
               ListTile(
                 leading: Icon(Icons.circle_outlined, color: Colors.white,),
                 title:   Text("Aed 48.50/ pictures Pakage",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),




              ),


               ],),

                Padding(
               padding: const EdgeInsets.only(left: 40,right: 40),
               child: MaterialButton(
               color: Colors.blue,
               minWidth: double.infinity,
               height: 50,
               onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Strip ()));// signup
               },
               shape: RoundedRectangleBorder(
                 side: BorderSide(
                   color: Colors.blue,
                 ),
                  borderRadius: BorderRadius.circular(16),
               ),
               
                 child:   Text("Continue",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
               


               ),
             ),
                      
                
          
          ],),
        ),
      ),
      
    );
  }
}