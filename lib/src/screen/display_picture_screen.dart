import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DisplayPictureScreen extends StatefulWidget {
  DisplayPictureScreen({
    Key key,
    @required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Picture"),
      ),
      body: Center(
        child: Image.file(
          File(widget.imagePath),
        ),
      ),
    );
  }
}
