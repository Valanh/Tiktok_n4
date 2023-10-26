import 'package:flutter/material.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key});

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 12,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          padding: EdgeInsets.all(8),
        );
      },
    );
  }
}
