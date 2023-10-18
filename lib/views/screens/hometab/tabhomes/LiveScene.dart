import 'package:flutter/material.dart';

class LiveScene extends StatefulWidget {
  const LiveScene({super.key});

  @override
  State<LiveScene> createState() => _LiveSceneState();
}

class _LiveSceneState extends State<LiveScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
