import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'DashBoard.dart';
final _auth = FirebaseAuth.instance;
String? name;
String? email;
String? imageUrl;
final GoogleSignIn _googleSignIn= GoogleSignIn();
Future<void> signInWithGoogle(context) async {
  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser!.uid);

    print('signInWithGoogle succeeded: $user');

    //return '$user';
  }
  if(name!=null){
    Navigator.push(context, MaterialPageRoute(builder: (_) => Deshboard()));
  }
  //return null;
}
//For signing out of a Google account:

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();

  print("User Signed Out");
}