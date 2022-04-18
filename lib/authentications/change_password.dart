// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:insta_look/authentications/login_user.dart';

// class ChangePassword extends StatefulWidget {
//   ChangePassword({Key? key}) : super(key: key);

//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   final _formKey = GlobalKey<FormState>();

//   var newPassword = "";


//   final newPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     newPasswordController.dispose();
//     super.dispose();
//   }

//   final currentUser = FirebaseAuth.instance.currentUser;
//   changePassword() async {
//     try {
//       await currentUser!.updatePassword(newPassword);
//       FirebaseAuth.instance.signOut();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Login()),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.orangeAccent,
//           content: Text(
//             'Your Password has been Changed. Login again !',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ),
//       );
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          centerTitle: true,
//         backgroundColor: Colors.black,
//     title: Text('Change password'),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         bottom: Radius.circular(30),
//       ),
//     ),
//       ),

//       body:  Form(
//       key: _formKey,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//         child: ListView(
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               child: TextFormField(
//                 autofocus: false,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Enter new password',
//                   prefixIcon: Icon(Icons.email),
//                   hintStyle: TextStyle(color: Colors.grey),
//                    errorStyle:
//                           TextStyle(color: Colors.redAccent, fontSize: 15),
//                   filled: true,
//                   fillColor: Colors.white70,
//                    border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                     borderSide: BorderSide(color: Colors.grey, width: 2),
                  
//                    ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.grey, width: 2),
                    
                    
//                   ),
//                 ),
//                 controller: newPasswordController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please Enter Password';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//     primary: Colors.black, // background
//     onPrimary: Colors.white, // foreground
//   ),
  
//               onPressed: () {
               
//                 // Validate returns true if the form is valid, otherwise false.
//                 if (_formKey.currentState!.validate()) {
//                   setState(() {
//                     newPassword = newPasswordController.text;
//                   });
//                   changePassword();
//                 }
//               },
//               child: Text(
//                 'Change Password',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     );
//   }
// }