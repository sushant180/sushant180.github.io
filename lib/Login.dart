import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sandhya_garments/Facebook_login.dart';
import 'package:sandhya_garments/otp_verification.dart';
import 'DashBoard.dart';
import 'authServices.dart';
import 'google_sign_in.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*String? phoneNo=null;
  String? verificationId=null;
  String? smsCode=null;
  bool iscodSent=false;*/
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Sandhya Garments',
          style: TextStyle(fontWeight: FontWeight.bold,

          ),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text('Sign in with google'),
                onTap: (){
              signInWithGoogle(context);
              if(name!=null){
    Navigator.push(context, MaterialPageRoute(builder: (_) => Deshboard()));}
                }),
              SizedBox(height:20.0),
              InkWell(
                  child: Text('Sign in with Facebook'),
                  onTap: (){
                    fb_sign_in(context);
                    }
                  ),
      ],

    )
    ),

    );
  }}