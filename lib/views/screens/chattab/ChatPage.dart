import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Text("lành");
                  })
          ),
          Row(
            children: [
              TextField(),
              IconButton.outlined(onPressed: () {

              }, icon: Icon(Icons.send_rounded))
            ],
          )
        ],
      ),
    );
  }
}
