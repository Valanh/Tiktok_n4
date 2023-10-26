import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
}
