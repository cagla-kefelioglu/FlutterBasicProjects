// ignore_for_file: unused_import, avoid_unnecessary_containers, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, missing_return, curly_braces_in_flow_control_structures, dead_code

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import '../../Components/TabBar/tab_bar_components.dart';
import '../../Components/rektör/card_components.dart';
import '../../Components/yan_bar.dart';
import '../../Constant/constant.dart';
import '../../Model/cardList.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';


class Randevular extends ConsumerStatefulWidget {
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RandevularState();
}

class _RandevularState extends ConsumerState<Randevular> {
  
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String inputFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
          var t3 = inputFormat.toString();
          List<String> yeniDate = t3.split(" ");
          var dateNow = yeniDate[0];
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
                         width: width *1,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Tab_bar(title: "RANDEVULARIM"),
                             Expanded(
                               child: randevu_list(dateNow),
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

  FutureBuilder randevu_list(String dateNow) {
    return FutureBuilder(

      future: ReturnTodaysAppointments(dateNow),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {   
        if(snapshot.hasData){
                  return ListView.separated(
        // padding: [20,10,20,10].paddingLTRB,
        separatorBuilder: (context, index) => SizedBox(
          height: 0,
        ),
        itemBuilder: (context, index) {
          
            return CardComponenets(
              info: snapshot.data[index],
            );
          
        },
        scrollDirection: Axis.vertical,
        itemCount:snapshot.data.length,
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
Future<List<Randevu>> ReturnTodaysAppointments(String appointment_date) async {
  var url = "https://testrandevu.firat.edu.tr/api/check/date";
  Dio dio = Dio();
  var response =
      await dio.get(url, queryParameters: {"appointment_date": appointment_date});
  if (response.statusCode == 200 ) {
    print(response.data);
    var body = response.data["data"] as List;
    List<Randevu> randevular = [];
    for (var element in body) {
      randevular.add(Randevu.fromJson(element));
    }
    return randevular.where((element) => element.status==1).toList();
  }
  return [];
}