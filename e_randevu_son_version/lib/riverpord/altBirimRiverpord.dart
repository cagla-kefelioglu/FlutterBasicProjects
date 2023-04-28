// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:randevu_deneme/Model/altBirim.dart';
import 'package:randevu_deneme/Model/altBirirmList.dart';

class AltBirimRiverpord {
  AltBirimList alt_birim = AltBirimList(alt_birim: [
    altBirimm(kontrolor: [
      Kontrolor(ad: "ad", unvan: "sekreter"),
      Kontrolor(ad: "ad", unvan: "vekil"),
      Kontrolor(ad: "ad", unvan: "vekil"),
    ], sekreter: [
      Sekreter(ad: "ddfdf", unvan: "kontrolör"),
      Sekreter(ad: "ddfdf", unvan: "vekil"),
      Sekreter(ad: "ddfdf", unvan: "vekil"),
    ])
  ]);
}
