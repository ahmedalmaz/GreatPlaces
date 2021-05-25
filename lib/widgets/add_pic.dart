import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPas;

class AddPic extends StatefulWidget {
  final Function _takePic;

  AddPic(this._takePic);
  @override
  _AddPicState createState() => _AddPicState();
}

class _AddPicState extends State<AddPic> {
  File _pickedImage;

  Future<void> _takeImage() async {
    final picker = ImagePicker();
    final imagePicker =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);

    if(imagePicker==null){
      return;
    }
    setState(() {
      _pickedImage = File(imagePicker.path);
    });
    final appDir = await sysPas.getApplicationDocumentsDirectory();

    final fileName = path.basename(imagePicker.path);
    final savedImage =
        await File(imagePicker.path).copy('${appDir.path}/$fileName');
    widget._takePic(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: _pickedImage != null
              ? Image.file(
                  _pickedImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text(
                  'No Image Added',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takeImage,
            label: Text('Pic Image'),
            icon: Icon(Icons.camera),
          ),
        )
      ],
    );
  }
}
