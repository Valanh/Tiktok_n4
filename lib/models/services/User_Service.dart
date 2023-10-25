import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toptop/views/screens/MainPage.dart';
import 'package:toptop/views/screens/profiletab/ProfilePage.dart';
import 'package:toptop/views/screens/profiletab/tabprofiles/editprofilepages/EditProfile.dart';

import '../../widgets/SnackBar_widget.dart';

class UserService {
  //lấy info của user
  static Future getUserInfo() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    const storage = FlutterSecureStorage();
    String? UID = await storage.read(key: 'uID');
    final result = await users.doc(UID).get();
    return result;
  }

  //lấy thông tin của người dùng khác
  static Stream getPeopleInfo(String peopleID) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final result = users.doc(peopleID).snapshots();
    return result;
  }

  static addUser({
    required String? UID,
    required String fullName,
    required String email,
  }) {
    // Call the user's CollectionReference to add a new user
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(UID)
          .set({
            'uID': UID,
            'fullName': fullName,
            'email': email,
            'following': [],
            'follower': [],
            'avartaURL':
                'https://iotcdn.oss-ap-southeast-1.aliyuncs.com/RpN655D.png',
            'phone': 'None',
            'age': 'None',
            'bio': 'None',
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {}
  }

  //Edit userInfo in firestore cloud
  static editUserFetch({
    required BuildContext context,
    required String collums,
    required String values,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final storage = const FlutterSecureStorage();
      String? UID = await storage.read(key: 'uID');
      users
          .doc(UID)
          .update({
            collums: values,
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  EditProifilePage()),
          (router) => true);
      getSnackBar(
        'Edit $collums',
        'Edit Success.',
        Colors.green,
      ).show(context);
    } catch (e) {
      getSnackBar(
        'Edit $collums',
        'Edit Fail. $e',
        Colors.red,
      ).show(context);
      print(e);
    }
  }
}
