// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import 'calender.dart';

class CalenderPages extends StatefulWidget {
  

  @override
  State<CalenderPages> createState() => _CalenderPagesState();
}

class _CalenderPagesState extends State<CalenderPages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calender(),
    );
  }
}

