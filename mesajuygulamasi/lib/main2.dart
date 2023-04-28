// ignore_for_file: unused_import, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mesaj Uyguması Versiyon 2",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mesajlaşma uygulaması :)")),
      body: AnaEkran(),
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
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenms) {
    setState(() {
      MesajBalonu mesajNesne = MesajBalonu(mesaj: gelenms);
      mesajListesi.insert(0, mesajNesne);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Flexible(
          child: TextField(
            controller: t1,
          ),
        ),
        IconButton(
            onPressed: () => listeyeEkle(t1.text), icon: const Icon(Icons.send))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: ((_, indexNumarasi) => mesajListesi[indexNumarasi]),
            ),
          ),
          const Divider(thickness: 1),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı_Adı";

class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin:const EdgeInsets.all(15),
      child: Row(children: <Widget>[
         CircleAvatar(child: Text(isim[0]),),
        Column(
          children: [
            Text(isim),
            Text(mesaj),
          ],
        )
      ]),
    );
  }
}
