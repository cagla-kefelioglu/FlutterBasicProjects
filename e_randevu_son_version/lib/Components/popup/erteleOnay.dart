// ignore_for_file: unused_import, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../Constant/constant.dart';
import '../../View/Rektor_screen/altBirim.dart';
import '../../View/Rektor_screen/randevular.dart';
import '../../assets.dart';

class ErteleOnay extends ConsumerStatefulWidget {
  

  @override
 ConsumerState<ConsumerStatefulWidget> createState() => _ErteleOnayState();
}

class _ErteleOnayState extends ConsumerState<ErteleOnay> {
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
        child: Column(children: [
          Container(
            height: height * 0.3,
            width: width * 0.9,
            decoration: _clikDecoration,
            child: Column(children: [
              Expanded(
                flex:3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Card(
                    elevation: 0,
                    child: Image.asset("assets/images/konfeti.png" , height: height*0.13,width: width*0.35,),
                  )
                 ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("Randevu ertelendi" , style: _infoText,)],),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0),
                  child: Column(
                    children: [
                      Expanded(
                      flex:1,
                       child: SizedBox(
                       // height: 51,
                         child: Row(children: [
                   Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                height: 51,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Constant.green,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12))),
                                    onPressed: () {Grock.to(Randevular());},
                                    child: Text(
                                      "Ana Sayfaya Dön",
                                      style: _buttonText,
                                    )),
                              ),
                            ),
                     ],),
                       )
                       ),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ]),
      );

  BoxDecoration _clikDecoration = BoxDecoration(
    color: Constant.darkWhite,
    borderRadius: BorderRadius.circular(20),
  );

  TextStyle _buttonText = TextStyle(
      fontSize: 21,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5,
      color: Constant.darkWhite);

  TextStyle _infoText = TextStyle(
    fontSize: 15,
    fontFamily: 'PoppinsBold',
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
    decoration: TextDecoration.none,
  );
}
