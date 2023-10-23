import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toptop/views/screens/MainPage.dart';
import 'package:toptop/views/tablogins/SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          info(),
          TextButton(onPressed: () {
           // Navigator.push(context,
           // CupertinoPageRoute(builder: (context) => MainPage()));
          }, child: Text("Đăng nhập")),
          TextButton(onPressed: () {
           Navigator.push(context,
           CupertinoPageRoute(builder: (context) => SignUpPage()));
          }, child: Text("Đăng ký")),
        ],
      ),
      )
    );
  }

  Widget info() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(margin: EdgeInsets.symmetric(vertical: 20),
              child: const Text('Sign up for TikTok',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Email",
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Password",
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
