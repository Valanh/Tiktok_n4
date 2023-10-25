import 'package:flutter/material.dart';
import 'package:toptop/models/services/Auth_Service.dart';
import 'package:toptop/models/services/User_Service.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/FavoriteVideos.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/LikeVideo.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/MyVideos.dart';
import 'package:toptop/widgets/ButtonEditProfile_widget.dart';

class ProFilePage extends StatefulWidget {
  const ProFilePage({super.key});

  @override
  State<ProFilePage> createState() => _ProFilePageState();
}

class _ProFilePageState extends State<ProFilePage>
    with TickerProviderStateMixin {
  bool isBio = false; //biến check để hiện thị mô tả hoặc thêm mô tả thông tin
  ScrollController scrollController = ScrollController();
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: FutureBuilder(
          future: UserService.getUserInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  //thanh menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Colors.pink,
                            size: 15,
                          )),
                      //Tên người dùng
                      Text(
                        snapshot.data.get('fullName').toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              AuthService.Logout(context: context);
                            });
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.pink,
                            size: 15,
                          )),
                    ],
                  ),
                  //ảnh Profile
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.upload,
                                color: Colors.pink,
                                size: 20,
                              )))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //thông tin Email
                  Text(
                    snapshot.data.get('email').toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Following
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data.get('following').length.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ), //số lượng
                            Text(
                              "Following",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8), fontSize: 10),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data.get('follower').length.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ), //số lượng
                            Text("Follower",
                                style: TextStyle(
                                  color: Colors.grey,
                            fontSize: 15,
                                ))
                          ],
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8), fontSize: 10),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Text(
                              "1.2M",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ), //số lượng
                            Text(
                              "Like",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      //follower
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //botton editt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Sửa hồ sơ
                      ButtonEditProfile(
                          check: true, nameButton: "Edit profile"),
                      SizedBox(
                        width: 10,
                      ),
                      ButtonEditProfile(check: false, nameButton: "Add frined"),
                      //Sửa hồ sơ
                    ],
                  ),
                  SizedBox(height: 5),
                  if (!isBio)
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey.withOpacity(0.25)),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 5,
                          color: Colors.black,
                        ),
                        label: Text("Add bio",
                            style: TextStyle(fontSize: 7, color: Colors.black)),
                      ),
                    ),
                  if (isBio)
                    Text("mô tả",
                        style: TextStyle(fontSize: 9, color: Colors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Sửa hồ sơ
                      Container(
                        height: 15,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.access_time_outlined,
                            size: 10,
                            color: Colors.red,
                          ),
                          label: Text("Your orders",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //Sửa hồ sơ
                      Container(
                        height: 15,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 10,
                            color: Colors.red,
                          ),
                          label: Text("Add yours",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  //tab view
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      indicatorColor: Colors.black,
                      indicatorWeight: 1,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.list,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.bookmark_added_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.heart_broken,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        MyVideoTab(),
                        FavorriteVideoTab(),
                        LikeVideoTab(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
