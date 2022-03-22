import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/Home_page.dart';
import 'package:insta_look/admin_bottom_bar.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ChangeHomescreen extends StatefulWidget {
  const ChangeHomescreen({ Key? key }) : super(key: key);

  @override
  State<ChangeHomescreen> createState() => _ChangeHomescreenState();
}

class _ChangeHomescreenState extends State<ChangeHomescreen> {
    TextEditingController TextController = TextEditingController();
      void text(String text , update) async {
      var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('https://dev.noqta-market.com/API/AddHomeScreenText.php'));
request.body = json.encode({
  "update": update,
  "text": text,
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 201) {
  
  print(await response.stream.bytesToString());

  print("New text edit Succeffuly");
}
else {
  print(response.reasonPhrase);
     final snackBar = SnackBar(
            content: const Text('Text Not Send try again'),
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
  print("No text edit");
}
 

  }
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

    body: SingleChildScrollView(
      child: Form(
         key: _formKey,
     
        child: Column(
                 children: [
                   SizedBox(height: 70,),
                 
                                      SizedBox(height: 15,),
      
                   
                   Padding(
                     padding: const EdgeInsets.only(left: 30,right: 20),
                     child: Column(children: [
                              
      
                      TextFormField(
                         validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  },

                       controller: TextController,
        decoration: InputDecoration(
        hintText: 'Enter Text',
        ),
      
      
      
      
      ), 
      SizedBox(height: 10,),
      
                  
       
                     ],
                     ),
                   ),
                   
  
      
      
       SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue,
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

                          text(TextController.text, TextController.text);
                           if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Text edit successfully')),
      );
    }
                       
                               
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Adminbottom ()));
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Change Text",
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