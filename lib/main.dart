import 'package:flutter/material.dart';
import 'package:live_stream/res/app_theme.dart';
// import 'package:video_stream/camera.dart';



// List<CameraDescription> cameras = [];
void main() async {
  // try {
  //   cameras = await availableCameras();
  // } on CameraException catch (e) {
  //   debugPrint(e.toString());
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Stream',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.primary,
      home:  Container(),
    );
  }
}
