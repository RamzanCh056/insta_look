import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_look/Home_page.dart';
import 'package:insta_look/Home_page_calls.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:country_code_picker/country_code_picker.dart';



enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class otp extends StatefulWidget {
  const  otp({Key? key}) : super(key: key);

  @override
  _otpState createState() => _otpState();
}

class _otpState extends State <otp> {
TextEditingController  phoneController = TextEditingController();
TextEditingController  otpController = TextEditingController();
LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
FirebaseAuth _auth = FirebaseAuth.instance;
String verificationID = "";
   CountryCode countryCode = CountryCode.fromDialCode('+92');

void SignOutME() async{
  await _auth.signOut();
}
void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
{

  try {
    final authCred = await _auth.signInWithCredential(phoneAuthCredential);

    if(authCred.user != null)
    {

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
      //ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Login Successfully')));
    }
  } on FirebaseAuthException catch (e) {

    print(e.message);
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
  }
}


showMobilePhoneWidget(context){
  return
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //  SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(children: [
           
              IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomePageCall(),));}, icon: Icon(Icons.arrow_back_ios)),
            
           ],),
         ),
       // SizedBox(height: 30,),
      //  SizedBox(height: 30,),
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
      //  SizedBox(height: 50,),
        Spacer(),
        Text("Verify Your Phone Number" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
       // SizedBox(height: 7,),
        SizedBox(height: 20,),
        Center(
          child:  Container(
                      // height: 60,
                      padding: EdgeInsets.only(left: 12, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        // border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                             controller: phoneController,
                             keyboardType: TextInputType.number,
                            //controller: phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: SizedBox(
                                height: 20,
                                child: CountryCodePicker(
                                  textOverflow: TextOverflow.visible,
                                  padding: EdgeInsets.only(
                                    top: 2,
                                    bottom: 7,
                                  ),
                                  onChanged: (code) {
                                    countryCode = code;
                                  },
                                  initialSelection: countryCode.dialCode,
                                  // optional. Shows only country name and flag
                                  showCountryOnly: true,
                                  
                                  // optional. Shows only country name and flag when popup is closed.
                                  showOnlyCountryWhenClosed: false,
                                  // optional. aligns the flag and the Text left
                                  alignLeft: false,
                                ),
                              ),
                              hintText: 'Phone Number',
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
//              IntlPhoneField(
//             controller: phoneController,
//     decoration: InputDecoration(
//         labelText: 'Phone Number',
//         border: OutlineInputBorder(
//             borderSide: BorderSide(),
//         ),
//     ),
//     initialCountryCode: 'PK',
//     onChanged: (phone) {
//         print(phone.completeNumber);
//     },
// )
          //   TextField(

          //   controller: phoneController,
          //  // keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),  ),
          //       hintText: "Enter Your PhoneNumber"
          //   ),
          // ),
        ),
        SizedBox(height: 20,),
         Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.black,
                        minWidth: double.infinity,
                        height: 50,
                          onPressed: ()  async{
          await _auth.verifyPhoneNumber(

              phoneNumber: "$countryCode${phoneController.text}",


                          //  phoneNumber: "+92${phoneController.text}",
              verificationCompleted: (phoneAuthCredential) async{


              },
              verificationFailed: (verificationFailed){
                print(verificationFailed);
              },

              codeSent: (verificationID, resendingToken) async{
                setState(() {

                  currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                  this.verificationID = verificationID;
                });
              },
              codeAutoRetrievalTimeout: (verificationID) async{

              }
          );},
                       
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Send Otp",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,color: Colors.white,
                          ),
      
                        ),
                      ),
                    ],
                ),
                  ),
        // ElevatedButton(
          
        //   onPressed: ()  async{
        //   await _auth.verifyPhoneNumber(

        //       phoneNumber: "${phoneController.text}",
        //                     //phoneNumber: "+92${phoneController.text}",
        //       verificationCompleted: (phoneAuthCredential) async{


        //       },
        //       verificationFailed: (verificationFailed){
        //         print(verificationFailed);
        //       },

        //       codeSent: (verificationID, resendingToken) async{
        //         setState(() {

        //           currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
        //           this.verificationID = verificationID;
        //         });
        //       },
        //       codeAutoRetrievalTimeout: (verificationID) async{

        //       }
        //   );
        // }, child: Text("Send OTP")
        // ),
        SizedBox(height: 5,),
        Spacer()
      ],
    ),
  );
}


showOtpFormWidget(context){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text("ENTER YOUR OTP" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 7,),
        SizedBox(height: 20,),
        Center(
          child:       TextField(

            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                hintText: "Enter Your OTP"
            ),
          ),
        ),
        SizedBox(height: 20,),
         Padding(
                    padding: const EdgeInsets.only(left: 45,right: 45),
                    child: Column(
                    children: [
                      MaterialButton(
                        color: Colors.black,
                        minWidth: double.infinity,
                        height: 50,
                         onPressed: () {

          AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
          signInWithPhoneAuthCred(phoneAuthCredential);
        },
                       
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Verify Otp",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,color: Colors.white,
                          ),
      
                        ),
                      ),
                    ],
                ),
                  ),

        // ElevatedButton
        // (
        //   onPressed: () {

        //   AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
        //   signInWithPhoneAuthCred(phoneAuthCredential);
        // }, 
        // child: Text("Verify")),
        SizedBox(height: 16,),
        Spacer()
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}