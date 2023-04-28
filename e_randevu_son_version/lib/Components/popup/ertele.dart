// ignore_for_file: unused_import, unused_local_variable, prefer_final_fields, must_be_immutable, unused_field, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, unnecessary_import, unused_element, file_names, avoid_unnecessary_containers, prefer_void_to_null, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unrelated_type_equality_checks, avoid_print, non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Constant/constant.dart';
import 'package:flutter/services.dart';
import '../../assets.dart';
import 'package:intl/intl.dart';

import '../../riverpord/randevuRiverpord.dart';
import 'erteleOnay.dart';

class ErteleDialogPopat extends StatelessWidget {
  var tarih;
  var saat;
  Randevu info;
  ErteleDialogPopat({this.tarih, this.saat, required this.info});
  String formattedDate;
  String timeApi;
   String tamApi;
  @override
  Widget build(BuildContext context) {
    //DateTime _date = DateFormat('dd/MM/yyyy').parse(widget.tarih);

    ValueNotifier<DateTime> _date =
        ValueNotifier(DateFormat('yyyy-MM-dd').parse(tarih));

    List yeniSaat = saat.split(":");

    ValueNotifier<TimeOfDay> _time = ValueNotifier(TimeOfDay(
        hour: int.parse(yeniSaat[0]), minute: int.parse(yeniSaat[1])));

    void _selectDate(BuildContext context) async {
      DateTime? _dataPicker = await showDatePicker(
          //locale: const Locale("tr"),
          context: context,
          initialDate: _date.value,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030));
      if (_dataPicker != null) {
        _date.value = _dataPicker;
        print(_date.value);
      }
    }

    void _selectTime(BuildContext context) async {
      TimeOfDay? _dataPicker = await showTimePicker(
        context: context,
        initialTime: _time.value,
      );
      if (_dataPicker != null) {
        _time.value = _dataPicker;
        print(_time.value);
      }
    }

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
// ignore: non_constant_identifier_names
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              constraints: BoxConstraints(
                minHeight: 200,
              ),
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: _boxDecoration,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Constant.grey,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    onPressed: () async {
                                      DateTime? _dataPicker =
                                          await showDatePicker(
                                              //locale: const Locale("tr"),
                                              context: context,
                                              initialDate: _date.value,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2030));
                                      if (_dataPicker != null) {
                                        _date.value = _dataPicker;
                                        formattedDate = DateFormat('yyyy-MM-dd')
                                            .format(_date.value);
                                        print(formattedDate);
                                      }
                                    },
                                    child: Container(
                                      child: ValueListenableBuilder(
                                          valueListenable: _date,
                                          builder: (context, date, _) {
                                            return Text(
                                              date != DateTime.now()
                                                  ? "${date.day}  /  ${date.month}  / ${date.year} "
                                                  : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                              style: _infoText.copyWith(
                                                  color: Constant.dark,
                                                  fontSize: 15),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: _boxDecoration,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Constant.grey,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    onPressed: () async {
                                      TimeOfDay? _dataPicker =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: _time.value,
                                      );
                                      if (_dataPicker != null) {
                                        _time.value = _dataPicker;
                                        timeApi =
                                            "${_time.value.format(context)}:00";

                                        //print(timeApi);
                                       
                                      }
                                    },
                                    child: Container(
                                      child: ValueListenableBuilder(
                                          valueListenable: _time,
                                          builder: (context, time, _) {
                                            return Text(
                                              "${time.hour} : ${time.minute}",
                                              style: _infoText.copyWith(
                                                  color: Constant.dark,
                                                  fontSize: 15),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            height: 51,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Constant.red,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                onPressed: () async {
                                   tamApi="$formattedDate $timeApi";
                                        print(tamApi);
                                   await UpdateAppointment(
                                        info.id,
                                        info.user_id,
                                        tamApi,
                                        info.appointment_taker_first_name,
                                        info.appointment_description,
                                        info.reject_reason,
                                        info.status,
                                        info.priority);
                                  _openDialog(context);
                                },
                                child: Text(
                                  "Ertele",
                                  style: _buttonText,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _clikDecoration = BoxDecoration(
    color: Constant.darkWhite,
    borderRadius: BorderRadius.circular(20),
  );
  TextStyle _buttonText = TextStyle(
      fontSize: 21,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5);
  TextStyle _infoText = TextStyle(
    fontSize: 11,
    fontFamily: 'PoppinsBold',
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
    decoration: TextDecoration.none,
  );
  InputDecoration _redInfo = InputDecoration(
    filled: true,
    fillColor: Colors.transparent,
    border: InputBorder.none,
    hintText: "Erteleme nedeninizi kısaca yazınız ",
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 11,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      decoration: TextDecoration.none,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.red)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.red)),
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );
  BoxDecoration _boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 20,
        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );
}

Future _openDialog(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => ErteleOnay()));
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
  var response = await dio.put(
    url,
    data: {
      "id": id,
      "user_id": user_id,
      "appointment_date": date,
      "appointment_taker_full_name": firstName,
      "appointment_description": description,
      "reject_reason": rejectReason,
      "status": status,
      "priority": priority,
    },
  );
  if (response.statusCode == 200) {
    print("Başarılı");
    return true;
  }
  return false;
}
