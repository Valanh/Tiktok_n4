import 'package:flutter/material.dart';

class FavorriteVideoTab extends StatefulWidget {
  const FavorriteVideoTab({super.key});

  @override
  State<FavorriteVideoTab> createState() => _FavorriteVideoTabState();
}

class _FavorriteVideoTabState extends State<FavorriteVideoTab> {
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
              color: Colors.yellow,
            ),
          );
        });
  }
}
