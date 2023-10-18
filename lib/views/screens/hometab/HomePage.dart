import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/hometab/tabhomes/FollowingScene.dart';
import 'package:toptop/views/screens/hometab/tabhomes/ForyouScene.dart';
import 'package:toptop/views/screens/hometab/tabhomes/FriendScenes.dart';
import 'package:toptop/views/screens/hometab/tabhomes/LiveScene.dart';
import 'package:toptop/views/screens/hometab/tabhomes/SecrchScene.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeSceneState();
}

void LiveSceneRouter(BuildContext context) {
  Navigator.push(
      context, CupertinoPageRoute(builder: (context) => LiveScene()));
}

class _HomeSceneState extends State<HomePage> with TickerProviderStateMixin {
  bool isSelect = true;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width:20,
              child: IconButton(onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => LiveScene()));
              }, icon: Icon(Icons.live_tv,size: 17,)),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Friends",),
                    Tab(text: "Following",),
                    Tab(text: "For You",),
                  ],
                  indicatorColor: Colors.white),
            ),
            Container(width:20,
              alignment: Alignment.center,
              child: IconButton(onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SearchScene()));
              }, icon: Icon(Icons.search,size: 17,)),
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController, children: [FriendScene(),FollowScene(),ForyouScene()]),
    );
  }
}
