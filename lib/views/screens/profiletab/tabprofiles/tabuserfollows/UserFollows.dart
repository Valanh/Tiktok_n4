import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/hometab/tabhomes/SecrchScene.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/tabuserfollows/FollowerPage.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/tabuserfollows/FollowingPage.dart';

class UserFollow extends StatefulWidget {
  UserFollow({Key? key,required this.indexCheckFLing}): super(key: key);
  bool indexCheckFLing = true;
  @override
  State<UserFollow> createState() => _UserFollowState();
}

class _UserFollowState extends State<UserFollow> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    if(widget.indexCheckFLing){
      _tabController.index = 0;
    }else{
      _tabController.index = 1;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width:20,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios_rounded,size: 15,color: Colors.black,)),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Following",),
                    Tab(text: "Follower",),
                  ],
                  indicatorColor: Colors.black),
            ),
            Container(width:20,
              alignment: Alignment.center,
              child: IconButton(onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SearchScene()));
              }, icon: Icon(Icons.search,size: 17,color: Colors.black,)),
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController, children: [FollowingPage(),FollowerPage()]),
    );
  }
}
