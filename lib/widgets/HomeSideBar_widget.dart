import 'dart:math';

import 'package:flutter/material.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({super.key});

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(),
          _sideBaritem("heart", "1.2M", style),
          _sideBaritem("messenger", "123", style),
          _sideBaritem("bookmark", "123", style),
          _sideBaritem("share", "Share", style),
          AnimatedBuilder(
              animation: _animationController,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: Image.asset("assets/images/disc.png"),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.yellow,
                  )
                ],
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: 2 * pi * _animationController.value,
                  child: child,
                );
              })
        ],
      ),
    );
  }

  _sideBaritem(String icon, String label, TextStyle style) {
    return Column(
      children: [
        Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$icon.png"),
                  fit: BoxFit.cover)),
        ),
        Text(
          label,
          style: style,
        ),
      ],
    );
  }

  _profileImageButton() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage("assets/images/imagedemo.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
