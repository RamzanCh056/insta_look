

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insta_look/authentications/change_password.dart';
import 'package:insta_look/authentications/login_user.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }
  final storage =  new FlutterSecureStorage();
    final _formKey = GlobalKey<FormState>();

  var newPassword = "";


  final newPasswordController = TextEditingController();
    
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Your Password has been Changed. Login again !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } catch (e) {}
  }
        bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       appBar: AppBar(
         
         backgroundColor: Color.fromARGB(197, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome"),
            ElevatedButton(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                await storage.delete(key: "uid"),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>LoginUser(),
                    ),
                    (route) => false)
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            )
          ],
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
        Row( mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Text("Email", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ],),
           SizedBox(height: 5,),
             Container(
                   height: 50,
                  
                   decoration: BoxDecoration(
                     border: Border.all(

                       color: Colors.black,
                       width: 1,
                     ),  borderRadius: BorderRadius.all(
            Radius.circular(10.0)),
                   ),
                    child:  Center(
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    
                 children: [
                   
                     Text(
                       '   Email: $email',
                       style: TextStyle(fontSize: 18.0),
                     ),
               
                   ],
               ),

                 ),),
                 
                Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                      user!.emailVerified
                        ? Text(
                            'verified',
                            style: TextStyle(fontSize: 16.0, color: Colors.green),
                          )
                        :Row(children: [
                           TextButton(
                            onPressed: () => {verifyEmail()},
                            child: Text('Verify Email', style: TextStyle(fontSize: 12.0, color: Colors.red),)      )
                        ],
                        ),
                  ],),
                 
               Row( mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Text("Created", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ],),
                  SizedBox(height: 5,),
             Container(
                   height: 50,
                  
                   decoration: BoxDecoration(
                     border: Border.all(

                       color: Colors.black,
                       width: 1,
                     ),  borderRadius: BorderRadius.all(
            Radius.circular(10.0)),
                   ),
                    child:  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '   Created: $creationTime ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
              ),
                 ), 
              
            

          // SizedBox(
          //   height: 95,
          //   child: Card(

         
          //     elevation: 5,
          //     child:   Column(children: [
          //        SizedBox(height: 13,),

                
               
          //       Center(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
                    
          //         children: [
                   
          //           Text(
          //             '   Email: $email',
          //             style: TextStyle(fontSize: 18.0),
          //           ),
               
          //         ],
          //     ),
          //       ),
          //      Center(
          //        child: Row(
          //          mainAxisAlignment: MainAxisAlignment.center,
          //          children: [
          //             user!.emailVerified
          //               ? Text(
          //                   'verified',
          //                   style: TextStyle(fontSize: 18.0, color: Colors.green),
          //                 )
          //               :Row(children: [
          //                  TextButton(
          //                   onPressed: () => {verifyEmail()},
          //                   child: Text('Verify Email', style: TextStyle(fontSize: 15.0, color: Colors.red),)      )
          //               ],
          //               )
          //         ],),
          //      )
          //     ],)
              
          //   ),
          // ),
            
            // SizedBox(height: 6,),
          //  SizedBox(
          //    height: 95,
          //    child: Card(
          //      elevation: 5,
          //      child:  Center(
          //        child: Row(
          //          mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             '   Created: $creationTime ',
          //             style: TextStyle(fontSize: 18.0),
          //           ),
          //         ],
          //     ),
          //      ),),
          //  ),
                     SizedBox(height: 6,),
              
            TextButton(onPressed: (){
              setState(() {
                
                              isVisible = !isVisible;
                              print("clicked");

              });
             
            }, child: Text("Change Password", style: TextStyle(fontSize: 18),)),
            Visibility(
              visible: isVisible,
              child: Column(children: [
                 Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter new password',
                      prefixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: Colors.grey),
                       errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                      filled: true,
                      fillColor: Colors.white70,
                       border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      
                       ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        
                        
                      ),
                    ),
                    controller: newPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    
                  onPressed: () {
                   
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = newPasswordController.text;
                      });
                      changePassword();
                    }
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
                      ),
                    ),
                      ),
              ],),
            )
          ],
        ),
          ),
      ),
    );
  }
}