// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors, camel_case_types, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_interpolation_to_compose_strings, depend_on_referenced_packages, prefer_adjacent_string_concatenation, unnecessary_string_interpolations, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:randevu_deneme/Components/TabBar/title.dart';
import 'package:randevu_deneme/Constant/constant.dart';
import 'package:jiffy/jiffy.dart';

import '../../assets.dart';
import '../rektör/driwir_components.dart';
import '../sekreter/driwir.dart';

class Tab_bar extends StatelessWidget {
  var now = DateTime.now();
  //var year = now.day;

  var title;
  Tab_bar({this.title});

  @override
  Widget build(BuildContext context) {
    Jiffy.locale("tr");
    Jiffy().yMMMMEEEEdjm;
    //await Jiffy("tr");
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 1,
      height: height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 10.0, top: height * 0.06, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.menuuSVG,
                    width: 33,
                    color: Constant.dark,
                  ),
                  onPressed: () {
                    //scaffoldKey.currentState?.openDrawer();
                    //Grock.to(DriwirComponents());
                    Grock.to(SekreterDriwirComponents());
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        
                        height: height * 0.07,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${Jiffy().format("EEEE")}",
                              style: _textStyle,
                            ),
                            Text(
                              "${Jiffy().format("MMMM")}" +
                                  " " +
                                  "${DateTime.now().year}",
                              style: _textStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${DateTime.now().day}",
                          style: TextStyle(
                              fontFamily: 'Bebas',
                              fontSize: 69,
                              color: Constant.dark,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Titlee(title: title),
        ],
      ),
    );
  }

  // ignore: prefer_final_fields
  TextStyle _textStyle = TextStyle(
      fontSize: 15,
      fontFamily: 'PoppinsBold',
      color: Constant.dark,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}
