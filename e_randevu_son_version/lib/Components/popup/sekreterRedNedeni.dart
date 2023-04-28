// ignore_for_file: unused_import, unused_local_variable, prefer_final_fields, must_be_immutable, unused_field, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, unnecessary_import, unused_element, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Constant/constant.dart';
import 'package:flutter/services.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';

class SekreterRedDialogPopat extends StatelessWidget {
  Randevu info;
  SekreterRedDialogPopat({required this.info});
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
                      child: Text(info.reject_reason),
                    ),
                  ),
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
