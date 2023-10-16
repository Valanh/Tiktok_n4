import 'package:flutter/material.dart';
import 'package:toptop/views/tabhomes/addcameratab/CameraPage.dart';

class ButtonEditProfile extends StatelessWidget {
  ButtonEditProfile({Key? key,
    required this.check,
    required this.nameButton}) : super(key: key);
  String nameButton;
  bool check;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      child: TextButton(
          onPressed: () => onclick(context),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.withOpacity(0.25))),
          child: Text(
            nameButton,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
          )),
    );
  }

  onclick(BuildContext context) {
    if(check == true){

    }else{

    }
  }
}
