import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toptop/models/services/Auth_Service.dart';
import 'package:toptop/views/screens/MainPage.dart';
import 'package:toptop/views/tablogins/SignUpPage.dart';
import 'package:toptop/widgets/SnackBar_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  String? validateEmail(String value) {
    if (value == '') {
      return "Empty Field !";
    } else if (!isValidEmail(value)) {
      return "Wrong Email !";
    } else {
      return null;
    }
  }

  doLogin(BuildContext context) {
    if (validate()) {
      AuthService.loginFetch(
          context: context,
          email: emailController.text,
          password: passwordController.text);
    }
    else{
      getSnackBar("Nhập trống", "Không được để trống", Colors.red);
    }
  }

  bool validate(){
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login with email',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(child: body(context)

      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Email",
            ),

          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Password",
            ),
            obscureText: true,

          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  doLogin(context);
                });
              },
              style: ElevatedButton.styleFrom(
                // Màu nền của nút
                backgroundColor: Colors.redAccent,
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          TextButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpPage(),));
          }, child: Text("Chưa có tài khoản thì đăng ký nha"))
        ],
      ),
    );
  }
}

