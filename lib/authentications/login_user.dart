import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insta_look/add_third_row.dart';
import 'package:insta_look/authentications/forgot_password.dart';
import 'package:insta_look/authentications/profile.dart';
import 'package:insta_look/authentications/signup_user.dart';
import 'package:insta_look/authentications/user_main.dart';
import 'package:insta_look/navigationbar.dart';

import '../small_navigation.dart';

class LoginUser extends StatelessWidget {
  const LoginUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Login ();
  }
}
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();


  userLogin() async {
    try {
      UserCredential userCredential=await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
         // print(userCredential.user?.uid);
          await storage.write(key: "uid", value: userCredential.user?.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainBottomClass(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.black,
    title: Text('Login'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
             SizedBox(height: 15,),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                                 height: 100,
                                width: 140,
                                 
                                  child: Image(image: AssetImage('images/logo.png')),
                               ),
              ],
            ),
          ),
          Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
               // autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  hintStyle: TextStyle(color: Colors.grey),
                   border: OutlineInputBorder(),
                   errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  
                   ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    
                    
                  ),
                ),
                 controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },               
                
                ),
      
      
                                 
      
              
                ),
      
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 10.0),
                //   child: TextFormField(
                //     autofocus: false,
                //     decoration: InputDecoration(
                //       labelText: 'Email: ',
                //       labelStyle: TextStyle(fontSize: 20.0),
                //       border: OutlineInputBorder(),
                //       errorStyle:
                //           TextStyle(color: Colors.redAccent, fontSize: 15),
                //     ),
                //     controller: emailController,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please Enter Email';
                //       } else if (!value.contains('@')) {
                //         return 'Please Enter Valid Email';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
              //  autocorrect: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter you password',
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.grey),
                   border: OutlineInputBorder(),
                    errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                          
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                   ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                 controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                
                ),
                
      
                ),
              
              
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 10.0),
                //   child: 
                //   // TextFormField(
                //   //   autofocus: false,
                //   //   obscureText: true,
                //   //   decoration: InputDecoration(
                //   //     labelText: 'Password: ',
                //   //     labelStyle: TextStyle(fontSize: 20.0),
                //   //     border: OutlineInputBorder(),
                //   //     errorStyle:
                //   //         TextStyle(color: Colors.redAccent, fontSize: 15),
                //   //   ),
                //   //   controller: passwordController,
                //   //   validator: (value) {
                //   //     if (value == null || value.isEmpty) {
                //   //       return 'Please Enter Password';
                //   //     }
                //   //     return null;
                //   //   },
                //   // ),
                // ),
               
                 // margin: EdgeInsets.only(left: 95.0),
                 
                       SizedBox(height: 20,),
                 Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.black,
                        minWidth: double.infinity,
                        height: 50,
                          onPressed: ()  {
                if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
          
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
                   
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          )
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(fontSize: 14.0),
                        ),
                   
                ),
      
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Validate returns true if the form is valid, otherwise false.
                      //     if (_formKey.currentState!.validate()) {
                      //       setState(() {
                      //         email = emailController.text;
                      //         password = passwordController.text;
                      //       });
                      //       userLogin();
                      //     }
                      //   },
                      //   child: Text(
                      //     'Login',
                      //     style: TextStyle(fontSize: 18.0),
                      //   ),
                      // ),
                     
                   
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Don't have an Account? "),
                      TextButton(
                        onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => Signup(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                              (route) => false)
                        },
                        child: Text('Signup'),
                      ),
                      // TextButton(
                      //   onPressed: () => {
                      //     Navigator.pushAndRemoveUntil(
                      //         context,
                      //         PageRouteBuilder(
                      //           pageBuilder: (context, a, b) => UserMain(),
                      //           transitionDuration: Duration(seconds: 0),
                      //         ),
                      //         (route) => false)
                      //   },
                      //   child: Text('Dashboard'),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ],),
      )
      
      
      
      
      
      
    );
  }
}