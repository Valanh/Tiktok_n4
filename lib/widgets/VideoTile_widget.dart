import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({super.key});
  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoPlayerController;
  late Future _future;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video_demo.mp4");
    _future = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(future: _future, builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
        return VideoPlayer(_videoPlayerController);
        }else{
          return Container(
            color: Colors.pink,
            child: Text("lỗi"),
          );
        }
      }),
    );
  }
}
