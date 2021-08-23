import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class MultiImage extends StatefulWidget {

  @override
  _MultiImageState createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  @override
  List<Asset> images = <Asset>[];
  void initState(){
    super.initState();
  }
  Future <void> pickImages() async{
    List<Asset> resultList=<Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 12,
        enableCamera: false,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "Pick 12 Image",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    setState(() {
      images = resultList;
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiImage Picker"),
      ),
      body: Container(
      child:Center(
        child:Column(
          children: <Widget>[
            RaisedButton(
          child: Text('Pick Your 12 binary Image'),
            onPressed: pickImages) ,
            SizedBox(height: 20.0,),
        RaisedButton(
            onPressed: () async{
              await DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2021,1,1),
                  maxTime: DateTime(2030,12,30), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
              await showTimePicker(context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
              );
            },
            child: Text(
              'Date and Time Picker',
              style: TextStyle(color: Colors.blue),
            )),
            SizedBox(height: 20.0,),
            Container(
              width:100.0,
                height: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).accentColor

                ),
                child: InkWell(
                  child:Center(
                      child:Text(
                          'Procced'
                      )
                  ),
                  onTap: (){},
                )
            )
          ]
        )
      ),)
    );
  }
}
