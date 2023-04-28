// ignore_for_file: unused_import, camel_case_types, file_names

import 'package:flutter/material.dart';

class altBirimm {
  List<Sekreter> sekreter;
  List<Kontrolor> kontrolor;

  altBirimm({ this.sekreter,   this.kontrolor});
}

class Kontrolor {
  String ad;
  String unvan;
  //List<kontrolorvekil> vekil;

  Kontrolor({this.ad,   this.unvan,/* required this.vekil*/});
}
class Sekreter {
  //List<String> sekreterBilgi;
  String ad;
  String unvan;

  Sekreter({  this.ad, this.unvan});
}












/*class kontrolorvekil {
  String ad;
  String unvan;
  
  kontrolorvekil({required this.ad, required this.unvan});
}*/