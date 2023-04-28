// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class YaziEkrani extends StatefulWidget {
  const YaziEkrani({Key? key}) : super(key: key);

  @override
  State<YaziEkrani> createState() => _YaziEkraniState();
}

class _YaziEkraniState extends State<YaziEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  var gelenbaslik="";
  var gelenicerik="";

  FirebaseAuth kisiNesne = FirebaseAuth.instance;


  yazigetir(){
    FirebaseFirestore.instance
    .collection("yazılar")
    .doc(t1.text)
    .get()
    .then((gelenVeri){
     setState(() {
       gelenbaslik=gelenVeri.data()!['baslik'];
       gelenicerik=gelenVeri.data()!['icerik'];
     });
    });
    
  }

  yaziEkle() {
     
   
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .set({'kullaniciİd': kisiNesne.currentUser!.uid,'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("işlem gerçekleştikten sonra bu işleme geçilir ."));
  }
  yaziGuncelle() {
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .update({'baslik': t1.text, 'icerik': t2.text});
  }
    yaziSil() {
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .delete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Yazı Ekranı")),
      body:Container(
      margin: EdgeInsets.all(50),
      child: Center(
          child: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          Row(
            children: [
              ElevatedButton(onPressed: yaziEkle, child: Text("EKLE")),
              ElevatedButton(onPressed: yaziGuncelle, child: Text("GÜNCELLE")),
              ElevatedButton(onPressed: yaziSil, child: Text("SİL")),
              ElevatedButton(onPressed: yazigetir, child: Text("DETAY")),
            ],
          ),
          ListTile(
            title: Text(gelenbaslik),
            subtitle: Text(gelenicerik),
          )
        ],
      )),
    ),
    );
    
    
  }
}
