import 'package:flutter/material.dart';
class PostPge extends StatefulWidget {
  const PostPge({ Key? key }) : super(key: key);

  @override
  _PostPgeState createState() => _PostPgeState();
}

class _PostPgeState extends State<PostPge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
                Column(
                 
                
                  children: [
        
        
                    Row(
                      children: [
                        Container(
                         
                           // color: Colors.black,
                              height: 30,
                              width: 30,
                               decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Colors.black,
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
                          
                          child: Icon(Icons.arrow_back_ios , color: Colors.black,  size: 16,)),
                  ],
                ),
                        
                        
                          ),
                      ],
                    ),
                  
                ],),
                SizedBox(height: 30,),
        
        
        
                      Column(children: [
                         Container(height: 300,
                      width: double.infinity,
                       child:   Image.asset('images/post.png' , fit: BoxFit.fill, 
                    
                    )
                      ),
        
                         
                      ],),
        
                      Column(children: [
        
                                    Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Column(children: [
                                
              
                        TextFormField(
          decoration: InputDecoration(
          hintText: 'Description',
          ),
               
              
              
              
              ), 
              SizedBox(height: 10,),
              
           TextFormField(
          decoration: InputDecoration(
          hintText: 'Hash Tag',
          ),
           
                      
           
                      ),
                    
               
                       ],),
                     ),
                      ],),
                      SizedBox(height: 40,),
                       Padding(
               padding: const EdgeInsets.only(left: 35,right: 35),
               child: MaterialButton(
               color: Colors.black,
               minWidth: double.infinity,
               height: 50,
               onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> youraccount ()));// signup
               },
               shape: RoundedRectangleBorder(
                 side: BorderSide(
                   color: Colors.white,
                 ),
                  borderRadius: BorderRadius.circular(10),
               ),
               child: Text("Post Now", style: TextStyle(color: Colors.white),),
               
               


               ),
             ),
        
        
        
                    
              
              
            ],),
          ),
        ),
      ),
    );
  }
}