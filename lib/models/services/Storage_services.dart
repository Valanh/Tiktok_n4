import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:toptop/models/VideoModel.dart';
import 'package:toptop/widgets/SnackBar_widget.dart';
import 'package:video_compress/video_compress.dart';

class StorageServices {
//Upload Image to Storage and get link
  static Future<String> uploadImage(File? imageFileX) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String currentUid = FirebaseAuth.instance.currentUser!.uid;
    var ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child(currentUid)
        .child('$fileName.jpg');
    var uploadTask = await ref.putFile(imageFileX!);
    String imageURL = await uploadTask.ref.getDownloadURL();
    return imageURL;
  }

  //nén video
  static compressVideo(String path) async {
    try {
      final compresDVideo = await VideoCompress.compressVideo(
          path,
          quality: VideoQuality.MediumQuality);
      return compresDVideo!.file;
    } catch (e) {
      throw Exception("lỗi nén video: $e");
    }
  }

  //Upload video lên storage và lấy link lưu vào firestore
  static Future<String> uploadVideoToStorage(String id, String path) async {
    try {
      String cureanID = FirebaseAuth.instance.currentUser!.uid;
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("videos")
          .child(cureanID)
          .child(id);
      UploadTask uploadTask = reference.putFile(await compressVideo(path));
      TaskSnapshot snapshot = await uploadTask;
      String urld = await snapshot.ref.getDownloadURL();
      return urld;
    } catch (e) {
      throw Exception("Update storage thất bại $e");
    }
  }

  //tạo ảnh cho video
  static getThumBnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  static Future<String> uploadImageToStorage(
      String id, String videoPath) async {
    String currentUid = FirebaseAuth.instance.currentUser!.uid;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('thumbnails')
        .child(currentUid)
        .child(id);
    UploadTask uploadTask = ref.putFile(await getThumBnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload video to firestore cloud
  static uploadVideo(BuildContext context, String songName, String caption,
      String videoPath) async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      // get id
      var allDocs = await FirebaseFirestore.instance.collection('videos').get();
      // ignore: unused_local_variable
      int len = allDocs.docs.length;

      String videoId = FirebaseFirestore.instance.collection("videos").doc().id;
      String videoUrl = await uploadVideoToStorage(videoId, videoPath);
      String thumbnail =
          await uploadImageToStorage("${videoId}_thumbnail", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['fullName'],
        uid: uid.toString(),
        id: videoId,
        likes: [],
        comments: [],
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['avartaURL'],
      );

      await FirebaseFirestore.instance
          .collection('videos')
          .doc(videoId)
          .set(
            video.toJson(),
          )
          .then((value) {
        Navigator.of(context).pop();
        getSnackBar(
          'Push Video',
          'Success.',
          Colors.green,
        ).show(context);
      });

      //Get.back();
    } catch (e) {
      getSnackBar('Error Uploading Video', e.toString(), Colors.redAccent);
      print(e);
    }
  }
}
