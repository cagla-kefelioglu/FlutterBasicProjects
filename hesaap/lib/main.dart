// ignore_for_file: unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hesap Makinesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HAYDİ HESAPLA !!"),
      ),
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
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  late num sayi1, sayi2;
  num sonuc=0;

  topla() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  cikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  carp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  bol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Text("$sonuc"),
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: topla,
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              child: const Text("Topla",
              style: TextStyle(fontSize: 20, color: Colors.black54)),
            ),
          ),
          SizedBox(
            width:120,
            child: ElevatedButton(
              onPressed: cikar,
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              child: const Text("Çıkar",
              style: TextStyle(fontSize: 20, color: Colors.black54)),
            ),
          ),
          SizedBox(
            width:120,
            child: ElevatedButton(
              onPressed: carp,
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              child: const Text("Çarp",
              style: TextStyle(fontSize: 20, color: Colors.black54)),
            ),
          ),
          SizedBox(
            width:120,
            child: ElevatedButton(
              onPressed: bol,
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              child: const Text("Böl",
              style: TextStyle(fontSize: 20, color: Colors.black54)),
            ),
          ),
        ],
      )),
    );
  }
}
