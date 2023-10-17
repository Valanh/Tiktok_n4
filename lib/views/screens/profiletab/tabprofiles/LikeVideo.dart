import 'package:flutter/material.dart';

class LikeVideoTab extends StatefulWidget {
  const LikeVideoTab({super.key});

  @override
  State<LikeVideoTab> createState() => _LikeVideoTabState();
}

class _LikeVideoTabState extends State<LikeVideoTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(0.4),
            child: Container(
              color: Colors.blue,
            ),
          );
        });
  }
}
