
import 'package:flutter/material.dart';
import 'package:insta_look/admin_bottom_bar.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

    body: SingleChildScrollView(
      child: Form(
     
        child: Column(
                 children: [
                   SizedBox(height: 70,),
                   SafeArea(
                     child: Container(
                       height: 120,
                      width: 140,
                       
                        child: Image(image: AssetImage('images/logo.png')),
                     ),
                   ),
                                      SizedBox(height: 15,),
      
                   
                   Padding(
                     padding: const EdgeInsets.only(left: 30,right: 20),
                     child: Column(children: [
                              
      
                      TextFormField(
        decoration: InputDecoration(
        hintText: 'Enter email',
        ),
      
      
      
      
      ), 
      SizedBox(height: 10,),
      
         TextFormField(
           obscureText: true,
        decoration: InputDecoration(
        hintText: 'Password',
        
        ),
      
                    
         
                    ),
                  
       
                     ],),
                   ),
                   
      Column(
        
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        //  SizedBox(width: 30,),
        children: [
      
        TextButton(onPressed: (){
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
        }, child: Padding(
        padding: const EdgeInsets.only(left: 190),
        child: Text("Forgot password"),
        )
        )
      ],),
      
      
       SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: (){
                               
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Adminbottom ()));
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,color: Colors.white,
                          ),
      
                        ),
                      ),
                    ],
                ),
                  ),
                              
      // Column(
        
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   //  SizedBox(width: 30,),
      //   children: [
      
      //   TextButton(onPressed: (){
      //   //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup ()));
      //      }, child: Padding(
      //   padding: const EdgeInsets.only(left: 190),
      //   child: Text("Signup"),
      //   )
      //   )
      // ],),
                            
      // Column(
      //   children: [
      //   TextButton(onPressed: (){}, child: 
      //    Text("or login with", style: TextStyle(color: Colors.grey),),
        
      //   )
      // ],),
      
      // SizedBox(height: 8,),
      //   Column(
      //   children: [
          
         
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           color: Colors.red,
      //           height: 50,
      //           width: 130,
      //           child: Row( mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //            FlatButton.icon(onPressed: (){    }, icon: Icon(Icons.email, color: Colors.white,), label: Text("Google ", style: TextStyle(color: Colors.white),)
      //            ),
      
      //           //   FlatButton.icon(onPressed: (){}, icon: Icon(Icons.image), label: Text("Gallery ")
      //           //  ),
      //           ],
                
      //           ),
                
      //         ),
      //         SizedBox(width: 20,),
      //         Container(
      //       color: Colors.blue,
      //       height: 50,
      //       width: 130,
      //       child: Row( mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
          
      
      //          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.facebook, color: Colors.white,), label: Text("Facebook ", style: TextStyle(color: Colors.white),)
      //         ),
      //       ],
      //       ),
      //     ),
      //       ],
      //     ),
        
      
      //    ],
      //    ),
      
               
           
      
      
                 ],
          
      
        ),
      ),
    ),


    );
  }
}