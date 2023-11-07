import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toptop/providers/loading_modle.dart';
import 'package:toptop/widgets/VideoTile_widget.dart';

class VideoSS extends StatefulWidget {
  VideoSS({Key? key,required this.url,required this.file}): super(key:key);
  final String url;
  final XFile file;
  @override
  State<VideoSS> createState() => _VideoSSState();
}

class _VideoSSState extends State<VideoSS> {
  final _addVideoFormKey = GlobalKey<FormState>();
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<LoadingModel>().isPushingVideo = false;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Consumer<LoadingModel>(
            builder: (context, value, child) {
              if (value.isPushingVideo) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                  ],
                );
              }else{
                return SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          height: MediaQuery.of(context).size.height / 2,
                          child: VideoTile(context: context,videoUrl: widget.url),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
