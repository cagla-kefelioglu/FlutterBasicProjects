// ignore_for_file: unused_import, unused_local_variable, prefer_final_fields, must_be_immutable, unused_field, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, unnecessary_import, unused_element, file_names, non_constant_identifier_names, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, missing_return

import 'package:dio/dio.dart';
import 'package:e_randevu_son_version/Components/popup/redOnaypopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Constant/constant.dart';
import 'package:flutter/services.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';



class RedDialogPopat extends StatelessWidget {
  Randevu info;
  RedDialogPopat({this.info});
  TextEditingController text1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: _buildChildRed(context, height, width),
    );
  }

  _buildChildRed(BuildContext context, double height, double width) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Red Sebebi  ",
                                    style: _buttonText,
                                  )
                                ],
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
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: text1,
                        maxLength: 300,
                        decoration: _redInfo,
                        style: _infoText,
                        minLines: 20,
                        maxLines: 50,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
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
                                    await UpdateAppointment(
                                        info.id,
                                        info.user_id,
                                        info.appointment_date,
                                        info.appointment_taker_first_name,
                                        info.appointment_description,
                                        text1.text.trim(),
                                        2,
                                        info.priority);
                                    _openDialog(context);
                                  },
                                  child: Text(
                                    "Reddet",
                                    style: _buttonText,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

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
    hintText: "Red nedeninizi kısaca yazınız ",
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
}

Future _openDialog(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => RedOnay()));
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
  try {
    var response = await dio.put(url, queryParameters: {
      "id": id,
      "user_id": user_id,
      "appointment_date": date,
      "appointment_taker_full_name": firstName,
      "appointment_description": description,
      "reject_reason": rejectReason,
      "status": status,
      "priority": priority,
    });

    if (response.statusCode == 200) {
      print("Başarılı");
      return true;
    }
    return false;
  } on DioError catch (e) {
    print(e);
  }
}
