// ignore_for_file: deprecated_member_use, camel_case_types, prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoResim extends StatelessWidget {
  const VideoResim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:butonEkrani(),
    );
  }
}

class butonEkrani extends StatefulWidget {
  const butonEkrani({Key? key}) : super(key: key);

  @override
  State<butonEkrani> createState() => _butonEkraniState();
}

class _butonEkraniState extends State<butonEkrani> {

late File yuklenecekVideo;
FirebaseAuth auth = FirebaseAuth.instance;
late String indirmeBaglantisi;


  kameradanVideoYukle() async {
    var alinanimg = await ImagePicker().getVideo(source: ImageSource.camera);
    setState(() {
      yuklenecekVideo = File(alinanimg!.path);
    });

    StorageReference referansYol = FirebaseStorage.instance
        .ref()
        .child("videolar")
        .child(auth.currentUser!.uid)
        .child("video.mp4");

    StorageUploadTask yuklemeGorevi = referansYol.putFile(yuklenecekVideo);
    String url = await (await yuklemeGorevi.onComplete).ref.getDowlandURL();
    setState(() {
      indirmeBaglantisi = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
        children: [
          ClipOval(
            child:indirmeBaglantisi==null ?Text("resim yok"): Image.network(indirmeBaglantisi,
                width: 100, height: 100, fit: BoxFit.cover),
          ),
          ElevatedButton(onPressed: kameradanVideoYukle, child: Text("Resim Yükle"))
        ],
      )),
    );
  }
}


videoEkle(){}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ElevatedButton(onPressed: videoEkle, child:Text("Video Ekle"))
      ],),
    );
  }
}