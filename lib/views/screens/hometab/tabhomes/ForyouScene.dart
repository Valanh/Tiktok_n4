import 'package:flutter/material.dart';
import 'package:toptop/widgets/HomeSideBar_widget.dart';
import 'package:toptop/widgets/VideoDetail.dart';
import 'package:toptop/widgets/VideoTile_widget.dart';

class ForyouScene extends StatefulWidget {
  const ForyouScene({super.key});

  @override
  State<ForyouScene> createState() => _ForyouSceneState();
}

class _ForyouSceneState extends State<ForyouScene> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoTile(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //tạo một vieo hiển thị video ở đây
                Expanded(flex: 3, child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: VideoDetail(),
                )),
                Expanded(child: Container(
                  height: MediaQuery.of(context).size.height / 1.75,
                  child: HomeSideBar(),
                )),
              ],
            ),
          ],
        );
      },
    );
  }
}
