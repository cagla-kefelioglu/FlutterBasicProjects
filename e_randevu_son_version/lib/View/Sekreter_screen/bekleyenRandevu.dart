// ignore_for_file: unused_import, avoid_unnecessary_containers, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, camel_case_types, use_key_in_widget_constructors, curly_braces_in_flow_control_structures

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
import '../../Components/yan_bar.dart';
import '../../Model/cardList.dart';
import '../../assets.dart';

final randevuRiverpord = ChangeNotifierProvider((ref) => RandevuRiverpord());

class bekleyenRandevular extends ConsumerStatefulWidget {
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _bekleyenRandevularState();
}

class _bekleyenRandevularState extends ConsumerState<bekleyenRandevular> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(randevuRiverpord); //anlık değişkenleri takip için
    var read = ref.read(randevuRiverpord);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                            Tab_bar(title: "BEKLEYEN RANDEVULAR"),
                            Expanded(
                              child: randevu_list(),
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

  FutureBuilder randevu_list() {
    return FutureBuilder(

      future: ReturnWaitingAppointments(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {   
        if(snapshot.hasData){
          return ListView.separated(
                           shrinkWrap: true,

        // padding: [20,10,20,10].paddingLTRB,
        separatorBuilder: (context, index) => SizedBox(
          height: 2,
        ),
        itemBuilder: (context, index) {
          String inputFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
          var t3 = inputFormat.toString();
          List<String> yeniDate = t3.split(" ");
          var dateNow = yeniDate[0];
         /*snapshot.data[index] == dateNow && snapshot.data[index].status ==1 */
         
            return bekleyenCardComponenets(
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
