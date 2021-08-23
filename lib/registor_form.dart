import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key ,key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Padding(
          padding: EdgeInsets.only(top: 50.0,right: 10.0,left: 10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("REGISTER",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.redAccent,

                ),),
              )
            ],
          ),
        )
    );
  }
}
