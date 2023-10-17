import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/MainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: () {
           Navigator.push(context,
           CupertinoPageRoute(builder: (context) => MainPage()));
          }, child: Text("Đăng nhập"))
        ],
      ),
    );
  }
}
