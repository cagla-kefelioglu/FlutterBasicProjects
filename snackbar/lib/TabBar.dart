// ignore_for_file: unused_import, prefer_const_constructors, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        appBar: AppBar(title:Text("TAB_BAR DENEME"),bottom: TabBar(tabs:[
          Tab(icon:Icon(Icons.directions_car)),
          Tab(icon:Icon(Icons.directions_train)),
          Tab(icon:Icon(Icons.directions_bike))

        ]),),
        // ignore: prefer_const_literals_to_create_immutables
        body: TabBarView(children: [
          Ekran1(),
          Ekran2(),
          Ekran3(),

        ]),
      ),
    );
  }
}

class Ekran1 extends StatelessWidget {
  const Ekran1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("1.SEKME")),);
  }
}
class Ekran2 extends StatelessWidget {
  const Ekran2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("2.SEKME")),);
  }
}
class Ekran3 extends StatelessWidget {
  const Ekran3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("3.SEKME")),);
  }
}