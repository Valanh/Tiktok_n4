import 'package:flutter/material.dart';

class Editprofileitem extends StatefulWidget {
  const Editprofileitem({super.key});

  @override
  State<Editprofileitem> createState() => _EditprofileitemState();
}

class _EditprofileitemState extends State<Editprofileitem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Row(children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Cancel"),
            )
          ],)
        ],
      ),
    );
  }
}
