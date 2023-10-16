import 'package:flutter/material.dart';

class MyVideoTab extends StatefulWidget {
  const MyVideoTab({super.key});

  @override
  State<MyVideoTab> createState() => _MyVideoTabState();
}

class _MyVideoTabState extends State<MyVideoTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            childAspectRatio: 4/5),
        itemCount: 90,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(0.4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/imagedemo.jpg",fit: BoxFit.cover,),
            ),
          );
        });
  }
}
