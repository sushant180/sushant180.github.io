
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sandhya_garments/MultiImagepicker.dart';
import 'package:sandhya_garments/Search.dart';
import 'package:sandhya_garments/authServices.dart';
import 'package:sandhya_garments/google_sign_in.dart';

import 'Login.dart';
class Deshboard extends StatefulWidget {


  @override
  _DeshboardState createState() => _DeshboardState();
}

class _DeshboardState extends State<Deshboard> {
  final picker=ImagePicker();
  late File _imageFiles;
  String imageUrl='null';
  Future pickImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
    _imageFiles=File(pickedFile!.path);
    });
  }
  Future uploadImageToFirebase(BuildContext context) async {
    //String fileName = basename(_imageFile.path);
   /* var firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$_imageFile.path');
    var uploadTask = firebaseStorageRef.putFile(_imageFile);
    var downloadUrl=await uploadTask.o.ref.getDownloadURL();*/
   /* taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
    );*/
    if (_imageFiles != null){
      //Upload to Firebase
      var snapshot = await FirebaseStorage.instance.ref()
          .child('uploads/_imageFiles.path')
          .putFile(_imageFiles);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandhya Garments'),
        actions: <Widget>[
          IconButton(onPressed: (){
            MultiImage();}, icon: Icon(Icons.camera)),
    IconButton(onPressed: (){
    showSearch(context: context, delegate: DetaSearch());
    },
    icon: Icon(Icons.search)),
    IconButton(onPressed: (){
    //AuthServices().signOut(context);
      signOutGoogle();
      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
    },
    icon: Icon(Icons.logout))

    ],
    leading: Icon(Icons.menu),
    ),
    resizeToAvoidBottomInset: true,
    body:SingleChildScrollView
    (child:
    Padding(
    padding:EdgeInsets.only(top:10.0,right: 10.0,left: 10.0) ,
              child:Center(
              child:Column(
              children: <Widget>[
              IconButton(onPressed: ()async{
              await pickImage();
              }, icon: Icon(Icons.camera_alt)),
              SizedBox(height: 20.0,),
              Container(
                child: InkWell(
                  child: Container(
                    width: 100,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Center(
                      child:Text(
                      'Your Name is ${name} with email id ${email}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),)
                  ),
                  onTap: ()async{
                    await uploadImageToFirebase(context);
                  },
                ),
              ),
              SizedBox(height: 20.0,),
            /* Form(
                 child:Row(
                   children: <Widget>[
                     SizedBox(width: 10.0,),
                     TextField(
                       decoration: InputDecoration(
                         hintText: 'Size',isCollapsed: true
                       ),
                       onChanged: (value){},
                     )
                   ],
                 )
             ),
             SizedBox(height: 15.0,).*/
             imageUrl!=null?
             Container(
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.black,
                   width: 5.0,
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               padding: EdgeInsets.all(20.0),
               child: Image.network(imageUrl,fit: BoxFit.fill,),

             ):Container(),


              /*imageUrl != null?ListView.builder(itemBuilder: (context,index)=>
                  ListTile(
                      title:Container(
                padding: EdgeInsets.all(20.0),
                child: Image.network(imageUrl),

              )),
                itemCount: 5,
              )
                  :Container()*/
            ]
          ),


)
        )   )
    );

  }

}



