import 'package:flutter/material.dart';

class AddfrinedProfile extends StatefulWidget {
  const AddfrinedProfile({super.key});

  @override
  State<AddfrinedProfile> createState() => _AddfrinedProfileState();
}

class _AddfrinedProfileState extends State<AddfrinedProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Text("đang phát triển"),
      ),
    );
  }
}
