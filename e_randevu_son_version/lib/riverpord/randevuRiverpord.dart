// ignore_for_file: unused_import, non_constant_identifier_names, file_names, unused_label

import 'package:flutter/material.dart';
import 'package:randevu_deneme/Model/cardList.dart';
import 'package:randevu_deneme/Model/cardModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class RandevuRiverpord extends ChangeNotifier {
  RandevuCardsModel randevu_card = RandevuCardsModel(randevu_card: [
    randevu(
        durum: "Yüz Yüze",
        katilimci: ["çağla", "nisa", "emre"],
        konu: "randevu  deneme 1",
        onem: true,
        tarih: '26/01/2023',
        saat: "12:30 ", onay: true),
  ]);
}


class Randevu {
  int id;
  int user_id;
  String appointment_date;
  String appointment_taker_first_name;
  String appointment_description;
  int priority;
  List<String> user_list;
  int status;
  String reject_reason;
  String created_at;
  String updated_at;
  
  Randevu({
    this.id,
    this.user_id,
    this.appointment_date,
    this.appointment_taker_first_name,
    this.appointment_description,
    this.user_list,
    this.priority,
    this.status,
    this.reject_reason,
    this.created_at,
    this.updated_at,
  });

  Randevu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    appointment_date = json['appointment_date'];
    appointment_taker_first_name = json['appointment_taker_full_name'];
    appointment_description = json['appointment_description'];
    user_list = json['user_list'];
    priority = json["priority"];
    reject_reason = json['reject_reason'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    
  }
  
}

Future<List<Randevu>> GetAllAppointments() async {
  var url = "https://testrandevu.firat.edu.tr/api/appointments";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    // body.map((e) => print(e));
    List<Randevu> randevular = [];
    body.forEach(
      (element) {
        randevular.add(Randevu.fromJson(element));
      },
    );
    // List<Randevu> randevular = body.map((e) => Randevu.fromJson(e)).toList();
    return randevular;
  }
  return null;
}
Future<List<Randevu>> ReturnWaitingAppointments() async {
  var url = "https://testrandevu.firat.edu.tr/api/getAllWaitingAppointments";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    List<Randevu> randevular = [];
    body.forEach(
      (element) {
        randevular.add(Randevu.fromJson(element));
      },
    );
    return randevular;
  } else {
    return [];
  }
}
Future<List<Randevu>> ReturnConfirmedAppointments() async {
  var url = "https://testrandevu.firat.edu.tr/api/getAllConfirmedAppointments";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    List<Randevu> randevular = [];
    body.forEach(
      (element) {
        randevular.add(Randevu.fromJson(element));
      },
    );
    return randevular;
  } else {
    return [];
  }
}
Future<List<Randevu>> ReturnRejectedAppointments() async {
  var url = "https://testrandevu.firat.edu.tr/api/getAllDeclinedAppointments";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    List<Randevu> randevular = [];
    body.forEach(
      (element) {
        randevular.add(Randevu.fromJson(element));
      },
    );
    return randevular;
  } else {
    return [];
  }
}
Future<List<Randevu>> ReturnAllCanceledAppointments() async {
  var url = "https://testrandevu.firat.edu.tr/api/getAllCanceledAppointments";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    body = body["data"] as List;
    List<Randevu> randevular = [];
    body.forEach(
      (element) {
        randevular.add(Randevu.fromJson(element));
      },
    );
    return randevular;
  } else {
    return [];
  }
}