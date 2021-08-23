import 'package:flutter/material.dart';
import 'package:sandhya_garments/authServices.dart';

class DetaSearch extends SearchDelegate<String>{
  final items=[
    'Male','Female','Jeans','Shirt','Top','Payjamas','Undergarments'
  ];
  final recent_item=[
    'Male','Female'
  ];
@override
List<Widget> buildActions(BuildContext context) {
// TODO: implement buildActions
return[
  IconButton(onPressed: (){
  query='';
  }, icon: Icon(Icons.clear)),

];
}

@override
Widget buildLeading(BuildContext context) {
// TODO: implement buildLeading
return IconButton(onPressed: (){
  Navigator.of(context).pop();
}, icon: AnimatedIcon(
  icon: AnimatedIcons.arrow_menu, progress: transitionAnimation,
),

);
}

@override
Widget buildResults(BuildContext context) {
return Card(
  color: Colors.blue,
  child: Container(
    width: 150.0,
    height: 100.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0)
    ),
  child: Center(
    child: Text(query),
  ),
  ),

);
}

@override
Widget buildSuggestions(BuildContext context) {
// TODO: implement buildSuggestions
final suggestionsList=query.isEmpty?recent_item:items.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.share) ,
          title: Text(suggestionsList[index]),
        ),
      itemCount: suggestionsList.length,
    );
}
}