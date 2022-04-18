import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insta_look/authentications/login_user.dart';
import 'package:insta_look/colors/color.dart';
import 'package:insta_look/small_navigation.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
   //  WidgetsFlutterBinding.ensureInitialized();

   //Stripe.publishableKey = 'pk_test_51Kaw0BBNthAqbyRmx5rChWZfHcnDW8FQix5HnPN1izgxRCrVVUXYSdcVD3MFs7mXqKxHNM7pu5HI3Nh0Z6z2q9bi00cFq8FDBr';
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    final Storage =  new FlutterSecureStorage();
    Future<bool> checkLoginStatus() async{
      String? value = await Storage.read(key: "uid") ;
      if(value==null){
        return false;
      }
      return true;
    }
  @override
  Widget build(BuildContext context) {
    
     return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Insta_look',
      
      theme: ThemeData(
      primarySwatch: Palette.kToDark
        //primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: checkLoginStatus(),
        builder:(BuildContext context, AsyncSnapshot<bool> snapshot){
             if(snapshot.data == false){
               return LoginUser();
             }
            
              if (snapshot.connectionState == ConnectionState.waiting) {
            return Container( color: Colors.white,
              child: Center(child: CircularProgressIndicator()));
          }
          return MainBottomClass();
        })
   
    );
    }
    );
  }
  
}











