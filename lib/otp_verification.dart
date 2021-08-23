import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'authServices.dart';

class OtpVerification extends StatefulWidget {
  final phone_number;
  final verification_id;
  OtpVerification({this.phone_number,this.verification_id});
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String? otp=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                ),
              ),
              Container(
                width: 95,
                height: 194,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("lib/assets/logo.png"),
                  ),
                ),
              ),
              Spacer(
                flex: 16,
              ),
              Text(
                "OTP Verification",
              ),
              Spacer(
                flex: 11,
              ),
              Text(
                "Enter the OTP send to the",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.phone_number}",
                  ),
                  SizedBox(
                    width: 40,
                  ),

                ],
              ),
              Spacer(
                flex: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (String val) {
                    setState(() {
                      otp=val;
                    });
                  },
                  length: 6,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  obscuringCharacter: '*',
                  validator: (v) {
                    if (v!.length < 6) {
                      return "invalid otp";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Spacer(
                flex: 80,
              ),
              InkWell(
                onTap: () async{
                  // print("otp ${otp}");
                  print(otp);
                  print(widget.verification_id);

                  AuthServices().signInWithOtp(otp,widget.verification_id,context);
                },
                child: Container(
                  width: 314,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(77),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: 22,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify & Proceed",

                      ),
                      SizedBox(
                        width: 10,
                      ),

                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 260,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
