// ignore_for_file: file_names, prefer_const_constructors, avoid_web_libraries_in_flutter, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseblogg/anaSayfa.dart';
import 'package:firebaseblogg/main.dart';
import 'package:firebaseblogg/main2.dart';
import 'package:firebaseblogg/videoPlayer.dart';
import 'package:flutter/material.dart';

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
                    MaterialPageRoute(builder: (_) => VideoApp()),
                    (Route<dynamic> route) => true);
              },
              icon: Icon(Icons.play_arrow)),
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
                  MaterialPageRoute(builder: (_) => YaziEkrani()),
                  (Route<dynamic> route) => true);
            }),
        body: Container(
          child: KisiYazilar(),
        ));
  }
}

class KisiYazilar extends StatefulWidget {
  @override
  _KisiYazilarState createState() => _KisiYazilarState();
}

class _KisiYazilarState extends State<KisiYazilar> {

  
  FirebaseAuth nesneAdi2 = FirebaseAuth.instance;

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('yazılar')
      .where("kullaniciİd", isEqualTo:nesneAdi2.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['baslik']),
              subtitle: Text(data['icerik']),
            );
          }).toList(),
        );
      },
    );
  }
}
