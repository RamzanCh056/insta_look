import 'package:flutter/material.dart';
import 'package:insta_look/Home_page_calls.dart';
import 'package:insta_look/models/album.dart';
import 'package:insta_look/pages/instapayment.dart';
import 'package:insta_look/pages/logininstagram.dart';
import 'package:insta_look/pages/payment.dart';
import 'package:insta_look/stripe.dart';
import 'Home_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'models/api.dart';
import 'package:firebase_core/firebase_core.dart';



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
   //  WidgetsFlutterBinding.ensureInitialized();

   //Stripe.publishableKey = 'pk_test_51Kaw0BBNthAqbyRmx5rChWZfHcnDW8FQix5HnPN1izgxRCrVVUXYSdcVD3MFs7mXqKxHNM7pu5HI3Nh0Z6z2q9bi00cFq8FDBr';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  HomePageCall (),
      //Filters(),
      
      // HomePageCall(),  
      //  DemoApp(),
      // HomePageCall(),  
     // DemoApp (),
      
      
      // 
      //  IssueListApi(),
  
      // IssueListApi(),
      // HomePageCall(),
      // apiscall(),
      //instagram(),

      // HomePageCall(),
      //Payment(),
    //  CartPage(),
      //  with flutter pay.....Payment(),
    );
  }
}











