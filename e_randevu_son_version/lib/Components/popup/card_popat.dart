// ignore_for_file: unused_import, unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, duplicate_import, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


import '../../Constant/constant.dart';
import '../../Model/cardModel.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';
import 'ertele.dart';
import 'iptal_pop.dart';

class DialogPopat extends StatelessWidget {
  Randevu info;
  DialogPopat({required this.info});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    String inputFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var t3 = inputFormat.toString();
    List<String> dateNow = t3.split("-");
    var t4 = info.appointment_date.split(" ")[0].toString();
    List<String> dateCard = t4.split("-");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: _buildChild(context, height, width, dateNow, dateCard),
      ),
    );
  }

  _buildChild(BuildContext context, var height, var width, List<String> dateNow,
          List<String> dateCard) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: height * 0.3,
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              width: width * 0.1),
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
                            // alignment: Alignment.start,
                            child: Wrap(
                              spacing: width * 0.01,
                              children: [
                                /* for (int i = 0; i < info.katilimci.length; i++)
                                  Text(
                                    info.katilimci[i] + ",",
                                    style: _text,
                                  ),*/
                                Text(info.appointment_taker_first_name)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
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
                              Text("Yüz Yüze",
                                  style: _text.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Constant.red))
                            ],
                          ),

                          //butonlar
                          if (int.parse(dateNow[0]) < int.parse(dateCard[0]) ||
                              int.parse(dateNow[0]) == int.parse(dateCard[0]) &&
                                  int.parse(dateNow[1]) <
                                      int.parse(dateCard[1]) ||
                              int.parse(dateNow[0]) < int.parse(dateCard[0]) &&
                                  int.parse(dateNow[1]) ==
                                      int.parse(dateCard[1]) &&
                                  int.parse(dateNow[2]) <=
                                      int.parse(dateCard[2]))
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
                                        onPressed: () {
                                          //  print("sdjfhsdf");
                                          List<String> yeniDate =
                                              info.appointment_date.split(" ");
                                          // var dateTwoDay =
                                          //     int.parse(yeniDate[0]);
                                          if (true) {
                                            _openDialogTwo(
                                                context,
                                                info.appointment_date
                                                    .split(" ")[0],
                                                info.appointment_date
                                                    .split(" ")[1],info);
                                          }
                                          // ignore: avoid_print
                                        },
                                        child: Text(
                                          "Ertele",
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

                                          _openDialog(context,info);
                                        },
                                        child: Text(
                                          "İptal Et",
                                          style: _buttonText,
                                        )),
                                  ),
                                ),
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

Future _openDialog(context,info) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => IptalDialogPopat(info: info,)));
Future _openDialogTwo(context, tarih, saat,info) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => ErteleDialogPopat(tarih: tarih, saat: saat , info: info,)));
