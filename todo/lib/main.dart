// ignore_for_file: unused_import, deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "To Do Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alışveriş Listesi Uygulaması")),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t2 = TextEditingController();
  List alisveris = [];

  ekle() {
    setState(() {
      alisveris.add(t2.text);
      t2.clear();
    });
  }

  cikar() {
    setState(() {
      alisveris.remove(t2.text);
      t2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
      children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisveris.length,
              itemBuilder: (context, indexNo) => ListTile(
                subtitle: Text("Alışveriş Malzemeleri"),
                title: Text(alisveris[indexNo]),
              ),
            ),
          ),
          TextField(
            controller: t2,
            style: TextStyle(fontSize:20,color: Colors.black),
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: ekle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,

              ),
              child: Text("Ekle",style:TextStyle(color: Colors.white,fontSize:22)),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: cikar,
 style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,

              ),              child: Text("Çıkar",style:TextStyle(color: Colors.white,fontSize:22)),
            ),
          ),
      ],
    ),
        ));
  }
}
