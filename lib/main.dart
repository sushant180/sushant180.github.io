import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sandhya_garments/DashBoard.dart';
import 'package:sandhya_garments/Login.dart';
import 'package:sandhya_garments/MultiImagepicker.dart';
import 'package:sandhya_garments/New_dash.dart';
import 'package:sandhya_garments/registor_form.dart';

import 'authServices.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sandhya Garments',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Deshboard(),
      },
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar()
    );
  }
}



