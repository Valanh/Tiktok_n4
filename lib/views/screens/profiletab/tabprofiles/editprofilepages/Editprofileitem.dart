import 'package:flutter/material.dart';

class Editprofileitem extends StatefulWidget {
  Editprofileitem({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<Editprofileitem> createState() => _EditprofileitemState();
}

class _EditprofileitemState extends State<Editprofileitem> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: "tên ban đầu");
    TextStyle _style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle _stylebt = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 15, color: Colors.black);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("cancel", style: _stylebt),
                  ),
                  Text(
                    widget.title,
                    style: _style,
                  ),
                  TextButton(
                    onPressed: () {
                      //lưu thông tin
                      Navigator.pop(context);
                    },
                    child: Text(
                      "save",
                      style: _stylebt,
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: () {
                  //xóa text
                  controller.text = "";
                }, icon: Icon(Icons.cancel)),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text("mô tả chức năng edit thông tin",style: TextStyle(
                    color: Colors.black.withOpacity(0.8),fontSize: 12
                ),))
          ],
        ),
      ),
    );
  }
}
