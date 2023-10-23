import 'package:flutter/material.dart';

class VideoSS extends StatefulWidget {
  VideoSS({Key? key,required this.url}): super(key:key);
  String url;
  @override
  State<VideoSS> createState() => _VideoSSState();
}

class _VideoSSState extends State<VideoSS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(widget.url),
      ),
    );
  }
}
