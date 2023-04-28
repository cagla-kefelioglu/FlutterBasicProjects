// ignore_for_file: unused_import, file_names, use_key_in_widget_constructors, must_be_immutable, unused_local_variable, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
import '../../Model/altBirim.dart';

class AltBirirmcard extends StatelessWidget {
  //altBirimm info;

  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: width * 0.8,
        child: Container(
          height: 55,
          decoration: _boxDecoration,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Çağla KEFELİOĞLU (Sekreter)",
                  style: _textStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration = BoxDecoration(
      color: Constant
          .beige, //role göre kontrol olacak vekil ise sarı değilse beyaz
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(1),
          spreadRadius: 0,
          blurRadius: 30,
          offset: Offset(2, 2), // changes position of shadow
        ),
        BoxShadow(
          color: Constant.shadowGrey,
          spreadRadius: 0,
          blurRadius: 30,
          offset: Offset(10, 10), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(10));
  TextStyle _textStyle = TextStyle(
      color: Constant.dark,
      fontSize: 15,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);
}
