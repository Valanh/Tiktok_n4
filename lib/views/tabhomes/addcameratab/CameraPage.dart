import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _cameraController = CameraController(
      cameras.first, ResolutionPreset.medium,
      enableAudio: false);
  PageController _pageController =
  PageController(initialPage: 1, viewportFraction: 0.2);
  int SelectTap = 1;
  bool _isRecording = false;
  bool _isVideoRC = false;

  @override
  void initState() {
    super.initState();
    _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          if (_cameraController.value.isInitialized) _BuillCameraPreview(),
          Spacer(),
          Container(
            color: Colors.black,
            height: 70,
            child: _BuillCameraTemplateSelect(),
          )
        ],
      ),
    );
  }

  //màn hình camera
  Widget _BuillCameraPreview() {
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height - 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
              scale: 1.5,
              alignment: Alignment.center,
              child: CameraPreview(_cameraController)),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => {SystemNavigator.pop()},
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        )),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Icon(
                              Icons.music_note,
                              color: Colors.white,
                              size: 11,
                            ),
                          ),
                          Text(
                            "Add Sound",
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          // _BuillIconWithText();
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              _BuillCameraSelecter(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          //hiệu ứng
                        },
                        icon: Icon(Icons.face),
                        label: Text("Effects")),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // !_isRecording
                          //     ? _onRecordVideoPressed()
                          //     : _offRecordVideoPressed();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white),
                        child: Icon(
                          _isRecording ? Icons.stop : Icons.videocam,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          setState(() {});
                          //hiệu ứng
                        },
                        icon: Icon(Icons.upload_file),
                        label: Text("Uploads")),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //chọn chế độ chụp ảnh hoặc quay video
  Widget _BuillCameraSelecter() {
    final List<String> CameraType = ["Photo", "Video"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 25,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          height: 45,
          child: PageView.builder(
            itemCount: CameraType.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text(
                  CameraType[index],
                  style: style.copyWith(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //icon edit video
  Widget _BuillIconWithText(
      String icon, String lable, TextStyle style, double size) {
    return Column(
      children: [],
    );
  }

  //chọn cách tạo post
  Widget _BuillCameraTemplateSelect() {
    final List<String> postType = ["Camera", "Quick", "Template"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 45,
          child: PageView.builder(
            onPageChanged: (int page) => {
              setState(() {
                SelectTap = page;
              })
            },
            itemCount: postType.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text(
                  postType[index],
                  style: style.copyWith(
                      color: SelectTap == index ? Colors.white : Colors.grey),
                ),
              );
            },
          ),
        ),
        Container(
          height: 45,
          width: 50,
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 2.5,
          ),
        )
      ],
    );
  }

// //quay video
// Future<XFile?> captureVideo() async {
//   final CameraController? cameraController = _cameraController;
//   try {
//     final video = await cameraController?.stopVideoRecording();
//     setState(() {
//       _isRecording = false;
//     });
//     return video;
//   } on CameraException catch (e) {
//     debugPrint('Error occured while taking picture: $e');
//     return null;
//   }
// }
//
// void _onRecordVideoPressed() async {
//   final CameraController? cameraController = _cameraController;
//   try {
//     setState(() {
//       _isRecording = true;
//     });
//     await cameraController?.startVideoRecording();
//   } on CameraException catch (e) {
//     debugPrint('Error occured while taking picture: $e');
//   }
// }
//
// void _offRecordVideoPressed() async {
//   final navigator = Navigator.of(context);
//   final xFile = await captureVideo();
//   if (xFile != null) {
//     final String pathVd = xFile.path;
//     if (pathVd.isNotEmpty) {
//       navigator.push(
//         MaterialPageRoute(
//           builder: (context) => VideoSS(urls: pathVd),
//         ),
//       );
//     }
//   }
// }
}
