import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'DashBoard.dart';
/*Future<void> signInWithFacebook(context) async{
  final fb=FacebookAuth.instance;
  final LoginResult result = await fb.login(permissions: ["email",'public_profile']);
  //print(result.applicationId);
  //print(result.userId);
  //print(result.declinedPermissions);
  final AccessToken? accessToken=result.accessToken;
  AuthCredential credential = FacebookAuthProvider.credential(accessToken!.token);
  var result2=await FirebaseAuth.instance.signInWithCredential(credential);
  User? _user=result2.user;
  if(_user!=null){
    Navigator.push(context, MaterialPageRoute(builder: (_) => Deshboard()));
  }

  //facebookUser= credential.user as String?;


}*/
User? _user;
void fb_sign_in(context) async{
  final fb = FacebookAuth.instance;
  final LoginResult result = await fb.login(permissions: ['email',"public_profile", ]);
  switch (result.status) {
  case LoginStatus.success:
  final AccessToken? accessToken = result.accessToken;
  var tk=accessToken!.token;
  final graphResponse = await Dio().get(
  'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${tk}');
  final profile = graphResponse.data;
   print(profile);
  print('''
  Logged in!
  ''');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCredential fbcredential=FacebookAuthProvider.credential(accessToken.token);
  var result2 = (await _auth.signInWithCredential(fbcredential));
  _user= result2.user;
  if(_user!=null){
    Navigator.push(context, MaterialPageRoute(builder: (_) => Deshboard()));
    }

   break;
  case LoginStatus.cancelled:
   print("cancelled by user");
  return null;
  break;
    case LoginStatus.failed:
  print('Something went wrong with the login process.\n'
  'Here\'s the error Facebook gave us: ${result.message}');
  return null;
  break;

  }
}