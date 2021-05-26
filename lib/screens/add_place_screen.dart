import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greate_places/providers/great_places.dart';
import 'package:greate_places/widgets/add_pic.dart';
import 'package:greate_places/widgets/location.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key key}) : super(key: key);
  static const routeName = '/add_place_screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File _image;
  final _controller=TextEditingController();

  void _takePic(File image){
    _image = image;
  }
  void _savePlace(){
    if(_controller.text.isEmpty || _image==null){
      return;
    }
    Provider.of<GreatPlaces>(context,listen: false).addPlace(_controller.text, _image);
    Navigator.of(context).pop();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                    controller: _controller,
                     decoration:InputDecoration(
                       hintText: 'title'
                     ),
                    ),
                    SizedBox(height: 10,),
                   AddPic(_takePic),
                    SizedBox(height: 10,),
                    Location(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add place'),
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),
            ),

          )
        ],
      ),
    );
  }
}
