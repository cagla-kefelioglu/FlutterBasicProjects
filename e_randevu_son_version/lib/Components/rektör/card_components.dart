// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:randevu_deneme/Constant/constant.dart';

import '../../Model/cardModel.dart';

import '../../riverpord/randevuRiverpord.dart';
import '../popup/card_popat.dart';

// ignore: must_be_immutable
class CardComponenets extends StatelessWidget {
  Randevu info;

  //const CardComponenets({super.key});
  CardComponenets({ this.info});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GrockContainer(
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: width * 0.13,
              height: height * 0.18,
              child: 
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                     info.appointment_date.split(" ")[1],
                      style: _titleStyle,
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: width * 0.85,
            height: height * 0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.82,
                  //height: height * 0.18,
                  constraints: BoxConstraints(minHeight: height * 0.18,maxHeight:  double.infinity,),
                  child: Container(
                    decoration: _boxDecoration2,
                    child: GrockContainer(
                      onTap: () {
                        _openDialog(context, info);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Constant.cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(minHeight: height * 0.08 ,maxHeight:  double.infinity, ),
                                   
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        SizedBox(
                                          width: width * 0.50,
                                          child: Text(
                                            info.appointment_description,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: _titleStyle,
                                          ),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 15,
                                         color: info.priority==1
                                        ? Constant.red
                                        : Constant.darkWhite,
                                        )
                                      ],
                                    ),
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text("Yüz Yüze", style: _infoStyle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.08,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          "Katılımcılar :",
                                          style: _titleStyle,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Wrap(
                                              spacing: width * 0.01,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                               /* for (int i = 0;
                                                    i < info.katilimci.length;
                                                    i++)
                                                  Text(
                                                    info.katilimci[i] + ",",
                                                    style: _infoStyle,
                                                  ),*/
                                                  Text(info.appointment_taker_first_name )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: prefer_final_fields
  TextStyle _titleStyle = TextStyle(
      //overflow: TextOverflow.ellipsis,

      fontFamily: 'Poppins',
      fontSize: 15,
      color: Constant.dark,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  // ignore: prefer_final_fields
  TextStyle _infoStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    color: Constant.dark,
    fontWeight: FontWeight.w500,
  );

// ignore: prefer_final_fields
  BoxDecoration _boxDecoration2 = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(-10, -10), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.cardColor.withOpacity(0.4),
        spreadRadius: 0,
        blurRadius: 30,

        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );
  // ignore: prefer_final_fields

}

Future _openDialog(context, Randevu info) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => DialogPopat(
          info: info,
        )));
