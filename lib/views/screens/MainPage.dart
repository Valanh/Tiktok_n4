import 'package:flutter/material.dart';
import 'package:toptop/views/screens/addcameratab/CameraPage.dart';
import 'package:toptop/views/screens/chattab/ChatPage.dart';
import 'package:toptop/views/screens/hometab/HomePage.dart';
import 'package:toptop/views/screens/profiletab/ProfilePage.dart';
import 'package:toptop/views/screens/shoptabs/ShopPage.dart';

import '../../widgets/cusstom_icon_add.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}): super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  Color _colorVS = Colors.white,
      _colorUNVS = Colors.white,
      _colorBG = Colors.black;
  int _scenSelectSC = 0;
  final List<Widget> _page = [
    HomePage(),
    ChatPage(),
    ShopPage(),
    ProFilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_scenSelectSC], //bottomNav
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        selectedItemColor: _colorVS,
        unselectedItemColor: _colorUNVS,
        backgroundColor: _colorBG,
        //item tab
        items: [
          //nút home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //nút chat
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Shop",
          ),

          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: "",
          ),

          //nút mailbox
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_outlined),
            label: "Chat",
          ),

          //nút profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
        currentIndex: _current,
        //sự kiện click
        onTap: (value) {
          setState(() {
            _current = value;
            if (value == 0) {
              _colorVS = Colors.white;
              _colorUNVS = Colors.white;
              _colorBG = Colors.black;
            } else {
              _colorVS = Colors.black;
              _colorUNVS = Colors.black;
              _colorBG = Colors.white;
            }
            if (value >= 3) {
              _scenSelectSC = value - 1;
            } else if (value <= 1) {
              _scenSelectSC = value;
            } else {
              //open camera
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) {
                        return CameraPage();
                      }),
                  (route) => false);
            }
          });
        },
      ),
    );
  }
}
