import 'package:flutter/material.dart';
class Skip extends StatefulWidget {
  const Skip({ Key? key }) : super(key: key);

  @override
  _SkipState createState() => _SkipState();
}

class _SkipState extends State<Skip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20,),
             // SafeArea(
        //         child: Container(
                  
        //       //    color:   Color.fromARGB(239, 2, 13, 37),
        //           height: 250,
        //           width: double.infinity,
        //              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22) ,bottomRight: Radius.circular(22),
                     
                     
        //              ),
        //              color:  Color.fromARGB(239, 2, 13, 37),
        //              ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(16.0),
        //             child: Column(
        
                      
        //               children: [
        //                  SizedBox(height: 10,),
        //              Row(children: [
                       
        
        //                  Text("Link you instagram", style: TextStyle(color: Colors.white,fontSize: 22),)
                          
        
        //              ],),
        //              SizedBox(height: 10,),
        //               Row(children: [
        
        //                  Text("Link your instagram to organise your post with\n existing content", style: TextStyle(color: Colors.white,fontSize: 16),)
                          
        
        //              ],),
        
        //               SizedBox(height: 20,),
        
        //                 Padding(
        //          padding: const EdgeInsets.only(left: 35,right: 35),
        //          child: MaterialButton(
        //          color: Colors.white,
        //          minWidth: double.infinity,
        //          height: 50,
        //          onPressed: (){
        //           // Navigator.push(context, MaterialPageRoute(builder: (context)=> youraccount ()));// signup
        //          },
        //          shape: RoundedRectangleBorder(
        //            side: BorderSide(
        //              color: Colors.white,
        //            ),
        //             borderRadius: BorderRadius.circular(10),
        //          ),
                 
        //          child: Row(mainAxisAlignment: MainAxisAlignment.center,
        //            children: [
                        
           
        //           SizedBox(width: 10,),
        //           Text(
        //            "Login with instagram",
        //            style: TextStyle(
        //              fontWeight: FontWeight.w600,
        //              fontSize: 18,color: Colors.black,
        //            ),
        
        //          ),
        
                 
        
        //          ],),
                 
        
        
        //          ),
        //        ),
        
        //  SizedBox(height: 30,),
        //        GestureDetector(
               
        //          child: Row(
        //          mainAxisAlignment: MainAxisAlignment.center,
        //          children: [
        //            Text(
        //              'Close',
        //              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18, ),
        //            ),
                           
        //          ],
        //          ),
        //        ),
        
        //             ],),
        //           ),
              
        //         ),
        //       ),
          SizedBox(height: 20,),
        
              Column(children: [
        
         Row(
               mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                    //  color: Colors.white,
                      minWidth: 30,
                      height: 50,
                      
                      onPressed: (){
                     //  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddSecondRow ()));// signup
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                      
             Icon(Icons.add_circle_rounded, color: Colors.black, ),
                SizedBox(width: 10,),
                Text(
                 "Add a Row",
                 style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18,color: Colors.black,
                 ),
          
               ),
          
               
          
               ],),
                    ),
                  
                 
                  
                  
                  
                  ],
                ),
                SizedBox(height: 10,),
               Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                   width: 133,
                     
                     
          
          
                 ),
                   Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                   width: 133,
                  
          
          
                 ),
                 
          
          
                  ],),
                    Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                width: 133,
                  
          
                 ),
                 
          
          
                  ],),
                 
          
          
                  ],),
          
          
                  SizedBox(height: 10,),
        
                    Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
                    
          
          
                 ),
                   Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
                   
          
                 ),
                 
          
          
                  ],),
                    Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
                 
          
          
                 ),
                 
          
          
                  ],),
                 
          
          
                  ],),
                  SizedBox(height: 10,),
                  
                    Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
                   
                     
          
          
                 ),
                   Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
                   
                 ),
                 
          
          
                  ],),
                    Row(children: [
                 Container(
                     color: Colors.grey,
                     height: 118,
                     width: 133,
               
          
          
                 ),
                 
          
          
                  ],),
                 
          
          
                  ],),
                  SizedBox(height: 20,),
        
              ],)
        
        
        
        
        
        
        
        
        
        
        
        
        
          ],),
        ),



    );
  }
}