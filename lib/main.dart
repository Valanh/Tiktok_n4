import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/MainPage.dart';
import 'package:toptop/views/screens/addcameratab/CameraPage.dart';
import 'package:toptop/views/screens/profiletab/ProfilePage.dart';
import 'package:toptop/views/tablogins/LoginPage.dart';

late List<CameraDescription> cameras;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Top',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}



