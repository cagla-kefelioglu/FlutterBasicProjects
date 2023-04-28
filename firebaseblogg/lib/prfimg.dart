// ignore_for_file: file_names, prefer_const_constructors, avoid_web_libraries_in_flutter, deprecated_member_use, unused_local_variable, camel_case_types, unused_import, unnecessary_null_comparison, annotate_overrides, avoid_unnecessary_containers
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblogg/anaSayfa.dart';
import 'package:firebaseblogg/main.dart';
import 'package:firebaseblogg/main2.dart';
import 'package:firebaseblogg/video.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilEkrani extends StatelessWidget {
  const ProfilEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profil Sayfası"), actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => AnaSayfa()),
                    (Route<dynamic> route) => true);
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((deger) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Iskele()),
                      (Route<dynamic> route) => false);
                });
              },
              icon: Icon(Icons.exit_to_app))
        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => VideoResim()),
                  (Route<dynamic> route) => true);
            }),
        body: Container());
  }
}

class resimSayfasi extends StatefulWidget {
  const resimSayfasi({Key? key}) : super(key: key);

  @override
  State<resimSayfasi> createState() => _resimSayfasiState();
}

class _resimSayfasiState extends State<resimSayfasi> {
  late File yuklenecekResim;
  FirebaseAuth auth = FirebaseAuth.instance;
  late String indirmeBaglantisi;

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>baglantiAl());
  }

baglantiAl() async{
  String baglanti=await FirebaseStorage.instance
                        .ref()
                        .child("profilresimleri")
                        .child(auth.currentUser!.uid)
                        .child("profilresmi.png")
                        .getDownloadURL();

  setState(() {
    indirmeBaglantisi=baglanti;
  });
}

  kameradanYukle() async {
    var alinanimg = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      yuklenecekResim = File(alinanimg.path);
    });

    StorageReference referansYol = FirebaseStorage.instance
        .ref()
        .child("profilResimleri")
        .child(auth.currentUser.uid)
        .child("profilResmi.png");

    StorageUploadTask yuklemeGorevi = referansYol.putFile(yuklenecekResim);
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
          ElevatedButton(onPressed: kameradanYukle, child: Text("Resim Yükle"))
        ],
      )),
    );
  }
}
