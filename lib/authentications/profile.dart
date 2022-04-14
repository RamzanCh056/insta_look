

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


      body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
           
           ListTile(
             title:  Text(
              'User ID: $uid',
              style: TextStyle(fontSize: 18.0),
            ),
           ),
           
            Divider(thickness: 1,color: Colors.grey,),
         
          Row(
            children: [
              Text(
                '   Email: $email',
                style: TextStyle(fontSize: 18.0),
              ),
              user!.emailVerified
                  ? Text(
                      'verified',
                      style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                    )
                  : TextButton(
                      onPressed: () => {verifyEmail()},
                      child: Text('Verify Email'))
            ],
          ),
           Divider(thickness: 1,color: Colors.grey,),
          SizedBox(height: 6,),
          Row(
            children: [
              Text(
                '   Created: $creationTime ',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
                   SizedBox(height: 6,),
             Divider(thickness: 1,color: Colors.grey,),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
          }, child: Text("Change Password"))
        ],
      ),
    ),
    );
  }
}