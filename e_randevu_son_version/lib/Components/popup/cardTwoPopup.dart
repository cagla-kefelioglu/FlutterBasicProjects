// ignore_for_file: unused_import, unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, duplicate_import, unused_local_variable, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:e_randevu_son_version/Components/popup/redNedeniPop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


import '../../Constant/constant.dart';
import '../../Model/cardModel.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';
import 'onay.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TwoDialogPopat extends StatelessWidget {
  Randevu info;
  TwoDialogPopat({required this.info});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: _buildChild(context, height, width),
      ),
    );
  }

  _buildChild(BuildContext context, var height, var width) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Toplantı Konusu :",
                                style: _text.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Constant.orange),
                              ),
                              Container(
                                width: width * 0.7,
                                child: Text(info.appointment_description,
                                    style: _text),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: SvgPicture.asset(Assets.icons.closeSVG,
                              width: 33),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Katılımcılar : ",
                            style: _text.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Constant.orange),
                          ),
                          Container(
                            width: width * 0.7,
                            child: Wrap(
                              spacing: width * 0.01,
                              children: [
                                // for (int i = 0;
                                //     i < info.katilimci.length;
                                //     i++)
                                //   Text(
                                //     info.katilimci[i] + ",",
                                //     style: _text,
                                //   ),
                                Text(info.appointment_taker_first_name)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("Onaylandı :",
                                  style: _text.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Constant.green)),
                              Text(
                                "Çağla(Sekreter)",
                                style: _text,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("info.durum",
                                  style: _text.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Constant.red))
                            ],
                          ),

                          //butonlar
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 51,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Constant.green,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      onPressed: () async {
                                        await UpdateAppointment(
                                            info.id,
                                            info.user_id,
                                            info.appointment_date,
                                            info.appointment_taker_first_name,
                                            info.appointment_description,
                                            info.reject_reason,
                                            1,
                                            info.priority);
                                        _openDialogTwo(context);
                                      },
                                      child: Text(
                                        "Onayla",
                                        style: _buttonText,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 51,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Constant.red,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      onPressed: () {
                                        _openDialog(context, info);
                                      },
                                      child: Text(
                                        "Reddet",
                                        style: _buttonText,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      );

  BoxDecoration _clikDecoration = BoxDecoration(
    color: Constant.darkWhite,
    borderRadius: BorderRadius.circular(20),
  );
  TextStyle _text = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Constant.dark);
  TextStyle _buttonText = TextStyle(
      fontSize: 21,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5);
}
Future _openDialog(context, Randevu info) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => RedDialogPopat(
          info: info,
        )));
Future _openDialogTwo(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => RandevuOnay()));
Future<bool> UpdateAppointment(
  int id,
  int user_id,
  String date,
  String firstName,
  String description,
  String rejectReason,
  int status,
  int priority,
) async {
  var url = "https://testrandevu.firat.edu.tr/api/update";
  Dio dio = Dio();
  var response = await dio.put(url, queryParameters : {
    "id": id,
    "user_id": user_id,
    "appointment_date": date,
    "appointment_taker_full_name": firstName,
    "appointment_description": description,
    "reject_reason": rejectReason,
    "status": status,
    "priority": priority,
  },);
  if (response.statusCode == 200) {
    print("Başarılı");
    return true;
  }
  return false;
}
