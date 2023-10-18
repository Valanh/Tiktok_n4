import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/profiletab/ProfilePage.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/editprofilepages/Editprofileitem.dart';

class EditProifilePage extends StatefulWidget {
  const EditProifilePage({super.key});

  @override
  State<EditProifilePage> createState() => _EditProifilePageState();
}

class _EditProifilePageState extends State<EditProifilePage> {
  bool CheckIcon = true;

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 15, color: Colors.black);
    TextStyle styleLable = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.6),
        );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    alignment: Alignment.center,
                    child: Text(
                      "Edit profile",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _profileButtonEdit("Change photo", style),
                  SizedBox(
                    width: 50,
                  ),
                  _profileButtonEdit("Change video", style),
                ],
              ),
            ), //chức năng thay đổi ảnh profile
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "About you",
                style: styleLable,
              ),
            ),
            _editItemSelect(style, "Thông tin", "Name", Editprofileitem()),
            _editItemSelect(style, "Thông tin", "Username", Editprofileitem()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "link tik tok của bạn",
                    style: style,
                  ),
                  SizedBox(width: 15,),
                  Icon(
                    Icons.copy_rounded,
                    size: 15,
                  ),
                ],
              ),
            ), // Link tiktok đang phát triển
            _editItemSelect(style, "Thông tin", "Bio", Editprofileitem()),
            SizedBox(
              height: 20,
            ),
            Divider(color: Colors.grey.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Social",
                style: styleLable,
              ),
            ),
            _editItemSelect(
                style,
                "Add Instagram",
                "Instagram",
                Scaffold(
                  appBar: AppBar(),
                  body: Container(
                    alignment: Alignment.center,
                    child: Text("đang phát triển"),
                  ),
                )),
            _editItemSelect(
                style,
                "Add Youtobe",
                "Youtobe",
                Scaffold(
                  appBar: AppBar(),
                  body: Container(
                    alignment: Alignment.center,
                    child: Text("đang phát triển"),
                  ),
                )),
            _editItemSelect(
                style,
                "Add Twitter",
                "Twitter",
                Scaffold(
                  appBar: AppBar(),
                  body: Container(
                    alignment: Alignment.center,
                    child: Text("đang phát triển"),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Change display order",
                style: styleLable,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your orders",
                    style: style,
                  ),
                  Icon(
                    Icons.menu,
                    size: 15,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add yours",
                    style: style,
                  ),
                  Icon(
                    Icons.menu,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _profileButtonEdit(String key, TextStyle style) {
    if (key == "Change photo") {
      CheckIcon = true;
    } else {
      CheckIcon = false;
    }
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            if (CheckIcon)
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage("assets/images/imagedemo.jpg"),
                        fit: BoxFit.cover)),
              ),
            if (!CheckIcon)
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey),
              ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Icon(
                CheckIcon
                    ? Icons.camera_alt_outlined
                    : Icons.video_camera_back_outlined,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
        Text(
          "$key",
          style: style,
        ),
      ],
    );
  }

  //đang cần nâng cấp sau
  _editItemSelect(TextStyle style, String value, String itemName, Widget mh) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,elevation: 0
        ),
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => mh));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$itemName",
              style: style,
            ),
            Row(
              children: [
                Text(
                  "$value",
                  style: style,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.black.withOpacity(0.5),
                  size: 15,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
