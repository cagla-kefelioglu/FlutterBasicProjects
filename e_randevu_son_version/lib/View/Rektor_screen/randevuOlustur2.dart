// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, annotate_overrides, avoid_unnecessary_containers, unused_field, unused_local_variable, unnecessary_new, prefer_final_fields, prefer_typing_uninitialized_variables, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_this, use_key_in_widget_constructors, sized_box_for_whitespace, curly_braces_in_flow_control_structures, camel_case_types, must_be_immutable, prefer_interpolation_to_compose_strings, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';

import '../../Components/TabBar/tab_bar_components.dart';
import '../../Components/popup/onay.dart';
import '../../Constant/constant.dart';
import '../../riverpord/randevuRiverpord.dart';

class RandevOlusturTwo extends StatefulWidget {
  String saat;
  String tarih;

  RandevOlusturTwo(this.saat, this.tarih);

  @override
  State<RandevOlusturTwo> createState() => _RandevOlusturTwoState();
}

class _RandevOlusturTwoState extends State<RandevOlusturTwo> {
  TextEditingController tx1 = TextEditingController();
  TextEditingController tx2 = TextEditingController();
  bool isChecked = false;
  int deger=0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String tarih_api = "${widget.tarih} ${widget.saat}:00";
    List tarih_format = widget.tarih.split("-");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Constant.darkWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 1,
                      width: width * 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Tab_bar(title: "RANDEVU OLUŞTUR"),
                          Expanded(
                            child: SingleChildScrollView(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: height * 0.7,
                                    child: Form(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 1,
                                              height: 60,
                                              decoration: _boxDecorationTwo,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Tarih : ${tarih_format[2]} - ${tarih_format[1]} -${tarih_format[0]}  " ,
                                                         
                                                      style: TextStyle(
                                                          color: Constant
                                                              .accentDark,
                                                          fontFamily:
                                                              'PoppinsBold',
                                                          fontSize: 15,
                                                          letterSpacing: 0.6),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: width * 1,
                                              height: 60,
                                              decoration: _boxDecorationTwo,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Saat : " + widget.saat,
                                                      style: TextStyle(
                                                          color: Constant
                                                              .accentDark,
                                                          fontFamily:
                                                              'PoppinsBold',
                                                          fontSize: 15,
                                                          letterSpacing: 0.6),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 60,
                                              child: Container(
                                                decoration: _boxDecoration,
                                                child: TextFormField(
                                                  controller: tx1,
                                                  decoration:
                                                      _fiedlDecoration.copyWith(
                                                    labelText: "Katılımcılar",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 60,
                                              child: Container(
                                                decoration: _boxDecoration,
                                                child: TextFormField(
                                                  controller: tx2,
                                                  decoration:
                                                      _fiedlDecoration.copyWith(
                                                    labelText: "Konu",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              child: Container(
                                                child: CheckboxListTile(
                                                  //controlAffinity: ListTileControlAffinity.leading,
                                                  title: Text(
                                                    "Önemli",
                                                    style: TextStyle(
                                                        color: Constant.accentDark,
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'PoppinsBold',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  activeColor: Constant.red,
                                                  value: isChecked,
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      isChecked = value;
                                                      deger= isChecked==true ? 1 : 0;
                                                      print(deger);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 1,
                                              height: 60,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  //Grock.to(Randevular());
                                                  //Grock.to(bekleyenRandevular());
                                                  await CreateAppointment(
                                                      23,
                                                      tarih_api,
                                                      tx1.text.trim(),
                                                      tx2.text.trim(),
                                                      deger);
                                                       _openDialog(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                     primary:
                                                        Constant.green,
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(10),
                                                    )),
                                                child: Text(
                                                  "Randevuyu Onayla",
                                                  style: TextStyle(
                                                    color: Constant.darkWhite,
                                                    fontFamily: 'PoppinsBold',
                                                    fontSize: 25,
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _fiedlDecoration = InputDecoration(
      labelText: "Katılımcılar",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 195, 23, 10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Constant.dark,
        ),
      ),
      filled: true, //backgroundu değişmek için true yapılır
      fillColor: Constant.grey, //background

      labelStyle: TextStyle(
          color: Constant.hinText,
          letterSpacing: 0.6,
          fontSize: 15,
          fontFamily: 'PoppinsBold',
          fontWeight: FontWeight.w500));
  BoxDecoration _boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(-10, -10), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );
  BoxDecoration _boxDecorationTwo = BoxDecoration(
    color: Constant.grey,
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(-10, -10), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
    borderRadius: BorderRadius.circular(10.0),
  );
}

Future<bool> CreateAppointment(
  int userId,
  String appointmentDate,
  String appointmentTakerFullName,
  String appointmentDescription,
  int priority,
) async {
  var url = "https://testrandevu.firat.edu.tr/api/appointment/create";
  Dio dio = Dio();
  var response = await dio.post(
    url,
    queryParameters: {
      "user_id": userId,
      "appointment_date": appointmentDate,
      "appointment_taker_full_name": appointmentTakerFullName,
      "appointment_description": appointmentDescription,
      "priority": priority,
    },
  );
  if (response.statusCode == 200) {
    print("Başarılı");
    return true;
  }
  return false;
}
Future _openDialog(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => RandevuOnay()));