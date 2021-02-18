import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_demo/src/screen/camera_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Camera Demo"),
      ),
      body: FutureBuilder(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cameras = snapshot.data as List<CameraDescription>;
            if (cameras.length > 0) {
              return Center(
                child: Column(
                  children: cameras.map((cam) {
                    return RaisedButton(
                      onPressed: () {
                        onPressedCamera(cam);
                      },
                      child:
                          Text("camera : ${cam.name} - ${cam.lensDirection}"),
                    );
                  }).toList(),
                ),
              );
            } else {
              return Center(
                child: Text("No Camera Found!"),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: onPressedFloatingActionButton,
      //   child: Icon(Icons.camera_alt),
      // ),
    );
  }

  void onPressedCamera(CameraDescription cam) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(
          cameraDescription: cam,
        ),
      ),
    );
  }

  // void onPressedFloatingActionButton() {}
}
