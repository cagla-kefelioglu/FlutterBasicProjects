// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseblogg/profilSayfasi.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

Future <void> kayitOl() async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: t1.text, password:t2.text)
  .then((kullanici){
    FirebaseFirestore.instance.collection("kullanicilar")
    .doc(t1.text)  
    .set({"kullaniciEposta":t1.text,"kullaniciSifre":t2.text});

  });
}

giriYap(){
  FirebaseAuth.instance
  .signInWithEmailAndPassword(email: t1.text, password: t2.text)
  .then((kullanici){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>ProfilEkrani(),)
    );
   
  
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
            child: Column(
          children: [
            TextFormField(
              controller: t1,
              decoration: InputDecoration(hintText: "e-mail"),
            ),
            TextFormField(
              controller: t1,
              decoration:InputDecoration(hintText: "password")
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ElevatedButton(onPressed: kayitOl, child: Text("Kayıt Ol")),
                ElevatedButton(onPressed: giriYap, child: Text("Giriş Yap"))
              ],
            ),
          ],
        )),
      ),
    );
  }
}

