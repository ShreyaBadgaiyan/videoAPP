import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


final FirebaseStorage _storage=FirebaseStorage.instance;
final FirebaseFirestore _fireStore= FirebaseFirestore.instance;
class StoreData{
  Future<String> uploadVideo(String videoUrl) async{
    Reference ref =_storage.ref().child('videos/${DateTime.now()}.mp4');
    await ref.putFile(File(videoUrl));
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> saveVideoData(String videoDownloadUrl) async{
    await _fireStore.collection('videos').add({
      'url': videoDownloadUrl,
      'timeStamp':FieldValue.serverTimestamp(),
      'name': 'User Video',
    });
  }
}