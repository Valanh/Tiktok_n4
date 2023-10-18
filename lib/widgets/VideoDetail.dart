import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@yead_yaed",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ExpandableText(
            "mô tả thông tin video mô tả thông tin video mô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videomô tả thông tin videov",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.bold),
            expandText: "more",
            collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Icon(CupertinoIcons.music_note_2,size: 15,color: Colors.white,),
              SizedBox(width: 8,),
              Text("nhạc không lời",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
