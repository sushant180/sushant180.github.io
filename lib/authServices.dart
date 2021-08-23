

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sandhya_garments/Login.dart';
import 'package:sandhya_garments/main.dart';
import 'package:flutter/material.dart';

import 'DashBoard.dart';
class AuthServices{
  /*handleAuth(){
    return StreamBuilder(
       //stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context,snapshot){
          if(snapshot.hasData){
            return Deshboard();
          }
          else{
            return LoginPage();
          }
    },
    );
  }*/

  signOut(context){
    FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
  }
  signIn(PhoneAuthCredential authCreds,context)async{
   await FirebaseAuth.instance.signInWithCredential(authCreds);
   Navigator.push(context, MaterialPageRoute(builder: (_)=>Deshboard()));
  }
  signInWithOtp(smscode,verId,context){
PhoneAuthCredential authCreds=PhoneAuthProvider.credential(
    verificationId: verId, smsCode: smscode);
signIn(authCreds,context);
}
}