// ignore_for_file: unused_import, avoid_print, unused_field, prefer_final_fields, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, duplicate_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: unused_import, avoid_unnecessary_containers, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:randevu_deneme/Components/rekt%C3%B6r/driwir_components.dart';
import 'package:randevu_deneme/Components/TabBar/tab_bar_components.dart';
import 'package:randevu_deneme/Constant/constant.dart';
import 'package:randevu_deneme/riverpord/randevuRiverpord.dart';
import '../../Components/rektör/card_components.dart';
import '../../Components/rektör/istekCard.dart';
import '../../Components/sekreter/card.dart';
import '../../Components/sekreter/driwir.dart';
import '../../Components/sekreter/sonucCard.dart';
import '../../Components/yan_bar.dart';
import '../../Model/cardList.dart';
import '../../assets.dart';

final randevuRiverpord = ChangeNotifierProvider((ref) => RandevuRiverpord());

class sonuclananRandevular extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _sonuclananRandevularState();
}

class _sonuclananRandevularState extends ConsumerState<sonuclananRandevular> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(randevuRiverpord); //anlık değişkenleri takip için
    var read = ref.read(randevuRiverpord);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> ekranlar = [
      randevu_list(),
      randevu_list_Two(),
    ];

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
                          Tab_bar(title: "SONUÇLANAN RANDEVULAR"),
                          SizedBox(
                            //randevu_list(read.randevu_card),
                            height: height * 0.12,
                            width: width * 1,
                            child: ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: CupertinoSlidingSegmentedControl<int>(
                                    thumbColor: Constant.beige,
                                    backgroundColor: Constant.darkWhite,
                                    //padding: EdgeInsets.all(5),
                                    //selectedColor: Constant.darkWhite,
                                    //unselectedColor:  Constant.grey,
                                    //borderColor: Constant.dark,
                                    //pressedColor: Color.fromARGB(95, 255, 255, 255),
                                    groupValue: groupValue,
                                    onValueChanged: (groupValue) async {
                                      setState(
                                          () => this.groupValue = groupValue);
                                      print(groupValue);
                                    },
                                    children: {
                                      0: buildSegment("Onaylanan Randevular",
                                          width, height),
                                      1: buildSegment("Reddedilen Randevular",
                                          width, height),
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: ekranlar[groupValue]),
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

  Widget buildSegment(String text, width, height) => Container(
        width: width * 0.3,
        height: height * 0.08,
        // decoration: _boxDecoration,

        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: _titleStyle,
            ),
          ],
        ),
      );
  TextStyle _titleStyle = TextStyle(
      //overflow: TextOverflow.ellipsis,

      fontFamily: 'Poppins',
      fontSize: 15,
      color: Constant.dark,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
  BoxDecoration _boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Constant.darkWhite,
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 5,
        offset: Offset(-5, -5), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 5,
        offset: Offset(5, 5), // changes position of shadow
      ),
    ],
  );

  FutureBuilder randevu_list() {
    return FutureBuilder(
      future: ReturnConfirmedAppointments(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,

            // padding: [20,10,20,10].paddingLTRB,
            separatorBuilder: (context, index) => SizedBox(
              height: 2,
            ),
            itemBuilder: (context, index) {
              String inputFormat =
                  DateFormat('yyyy-MM-dd').format(DateTime.now());
              var t3 = inputFormat.toString();
              List<String> yeniDate = t3.split(" ");
              var dateNow = yeniDate[0];
              /*snapshot.data[index] == dateNow && snapshot.data[index].status ==1 */

              return onayCardComponenets(
                info: snapshot.data[index],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
          );
        }

        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }
 FutureBuilder randevu_list_Two() {
    return FutureBuilder(
      future: ReturnRejectedAppointments(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,

            // padding: [20,10,20,10].paddingLTRB,
            separatorBuilder: (context, index) => SizedBox(
              height: 2,
            ),
            itemBuilder: (context, index) {
              String inputFormat =
                  DateFormat('yyyy-MM-dd').format(DateTime.now());
              var t3 = inputFormat.toString();
              List<String> yeniDate = t3.split(" ");
              var dateNow = yeniDate[0];
              /*snapshot.data[index] == dateNow && snapshot.data[index].status ==1 */

              return onayCardComponenets(
                info: snapshot.data[index],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
          );
        }

        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }
 
}
