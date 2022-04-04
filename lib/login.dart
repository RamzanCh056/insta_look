
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/admin_bottom_bar.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email , password) async {
  
   var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://dev.noqta-market.com/API/Login.php'));
request.body = json.encode({
  "email": email,
  "password": password
}
);
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 201) {
  print(await response.stream.bytesToString());
     final snackBar = SnackBar(
            content: const Text('Login Successfully'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
   Navigator.push(context, MaterialPageRoute(builder: (context)=> Adminbottom ()));
                 

}
else {
  print(response.reasonPhrase);
  print("Wrong email and password");
                 final snackBar = SnackBar(
            content: const Text('Wrong email or password'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
}

  }
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

                       controller: emailController,
        decoration: InputDecoration(
        hintText: 'Enter email',
        ),
      
      
      
      
      ), 
      SizedBox(height: 10,),
      
         TextFormField(


          controller: passwordController,
           obscureText: true,
        decoration: InputDecoration(
        hintText: 'Password',
        
        ),
      
                    
         
                    ),
                  
       
                     ],),
                   ),
                   
   
      
      
       SizedBox(height: 27,),
                  Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.black,
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: 
                        //emailController.text == "" || passwordController.text ==""? null :


                          (
                            )
                            {
                          // setState(() {
                          //   _islooding  = true;
                          // });

                          login(emailController.text, passwordController.text);
         
                       
                               
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Adminbottom ()));
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
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
                              
   
               
           
      
      
                 ],
          
      
        ),
      ),
    ),


    );
  }
}