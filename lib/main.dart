import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptop/providers/loading_modle.dart';
import 'package:toptop/views/screens/chattab/ChatPage.dart';
import 'package:toptop/views/tablogins/LoginPage.dart';

import 'firebase_options.dart';

late List<CameraDescription> cameras;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoadingModel(),
      ),
    ],
    child: const MyApp(),
  ),);
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



