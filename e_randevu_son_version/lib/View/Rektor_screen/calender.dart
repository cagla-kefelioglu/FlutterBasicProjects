// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, annotate_overrides, avoid_unnecessary_containers, unused_field, unused_local_variable, unnecessary_new, prefer_final_fields, prefer_typing_uninitialized_variables, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_this, use_key_in_widget_constructors, sized_box_for_whitespace, curly_braces_in_flow_control_structures, avoid_web_libraries_in_flutter


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Components/TabBar/tab_bar_components.dart';
import '../../Components/rektör/card_components.dart';
import '../../Components/rektör/driwir_components.dart';
import '../../Constant/constant.dart';
import '../../Model/cardList.dart';
import '../../Model/cardModel.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';

final randevuRiverpord = ChangeNotifierProvider((ref) => RandevuRiverpord());

class Calender extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalenderState();
}

class _CalenderState extends ConsumerState<Calender> {
  var datee;
  var dateTwo;
  DateTime date = DateTime.now();
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(randevuRiverpord); //anlık değişkenleri takip için
    var read = ref.read(randevuRiverpord);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('tr', ''),
      ],
      locale: const Locale("tr"),*/
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Tab_bar(title: "TÜM RANDEVULAR"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: height * 0.35,
                            child: Container(
                              decoration: _cardContaier,
                              child: SfCalendar(                              
                                controller: _controller,
                                        viewNavigationMode: ViewNavigationMode.snap,

                                view: CalendarView.month,
                         showDatePickerButton: true,
                                allowedViews: [
                                  CalendarView.day,
                                  CalendarView.week,
                                  CalendarView.month,
                                ],
                                cellBorderColor: Colors.transparent,
                                selectionDecoration: BoxDecoration(
                                  border: Border.all(
                                      color: Constant.dark, width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  shape: BoxShape.rectangle,
                                ),
                                backgroundColor: Constant.darkWhite,
                                headerStyle: CalendarHeaderStyle(
                                    textAlign: TextAlign.center,
                                    backgroundColor: Constant.cardColor,
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'PoppinsBold',
                                        color: Constant.darkWhite,
                                        fontWeight: FontWeight.w500)),
                                onTap: (CalendarTapDetails details) async {
                                  setState(() {
                                    dynamic appointment = details.appointments;
                                    date = details.date!;
                                    CalendarElement element =
                                        details.targetElement;
                                    String inputFormat =
                                        DateFormat('yyyy-MM-dd').format(date);
                                    var t3 = inputFormat.toString();
                                    List<String> yeniDate = t3.split(" ");
                                    dateTwo = yeniDate[0];
                                    //datee = inputFormat.format(date);
                                    print(dateTwo);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        //Titlee(title: 'Randevular'),
                        Expanded(
                          child: randevu_list(dateTwo),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
/*dateTwo == model.randevu_card[index].tarih*/

  FutureBuilder randevu_list(String dateTwo) {
    return FutureBuilder(
      future: ReturnTodaysAppointments(dateTwo),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            // padding: [20,10,20,10].paddingLTRB,
            separatorBuilder: (context, index) => SizedBox(
              height: 0,
            ),
            itemBuilder: (context, index) {
              /* snapshot.data[index] == dateNow*/
                return CardComponenets(
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

  BoxDecoration _cardContaier = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Constant.shadowGrey.withOpacity(0.4),
        spreadRadius: 0,
        blurRadius: 30,

        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );
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
    return randevular;
  }
  return [];
}
// .where((element) => element.status==1).toList()