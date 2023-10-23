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
  bool isPause = false;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video_demo.mp4");
    _future = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    _videoPlayerController.setVolume(1);
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
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!isPause) {
                        _videoPlayerController.pause();
                        isPause = !isPause;
                      } else {
                        _videoPlayerController.play();
                        isPause = !isPause;
                      }
                    });
                  },
                  child: VideoPlayer(_videoPlayerController));
            } else {
              return Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: Text("chờ"),
              );
            }
          }),
    );
  }
}
