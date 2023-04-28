// ignore_for_file: unused_import, prefer_const_constructors, sort_child_properties_last, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({super.key});

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer deneme")),
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: const Text("DRAWER MENÜ",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, letterSpacing: 5)),
              decoration: BoxDecoration(color: Colors.amber),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.amber,
                size: 30,
              ),
              title: Text("Ana Sayfa",
                  style: TextStyle(fontSize: 15, letterSpacing: 3)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.amber,
                size: 30,
              ),
              title: Text("Çıkış yap",
                  style: TextStyle(fontSize: 15, letterSpacing: 3)),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
