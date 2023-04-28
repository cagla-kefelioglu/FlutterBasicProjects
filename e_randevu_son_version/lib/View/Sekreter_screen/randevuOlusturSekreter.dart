// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, annotate_overrides, avoid_unnecessary_containers, unused_field, unused_local_variable, unnecessary_new, prefer_final_fields, prefer_typing_uninitialized_variables, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_this, use_key_in_widget_constructors, sized_box_for_whitespace, curly_braces_in_flow_control_structures, camel_case_types, no_leading_underscores_for_local_identifiers, unused_element, sort_child_properties_last

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:randevu_deneme/Components/TabBar/title.dart';
import 'package:randevu_deneme/View/Rektor_screen/randevuOlustur2.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Components/TabBar/tab_bar_components.dart';
import '../../Components/randevuOlusturcard.dart';
import '../../Components/rektör/card_components.dart';
import '../../Components/rektör/driwir_components.dart';
import '../../Constant/constant.dart';
import '../../Model/cardList.dart';
import '../../Model/cardModel.dart';
import '../../assets.dart';
import '../../riverpord/randevuRiverpord.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final randevuRiverpord = ChangeNotifierProvider((ref) => RandevuRiverpord());

class randevuOlusturSek extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _randevuOlusturSekState();
}

class _randevuOlusturSekState extends ConsumerState<randevuOlusturSek> {
  var datee;
  var dateTwo;
  String deneme;
  DateTime date = DateTime.now();
  CalendarController _controller = CalendarController();
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget customRadio(String text, int index) {
      return OutlinedButton(
        onPressed: () {
          setState(() {
            selected = index;
            print("$selected + $index");
            deneme = text;
            print(text);
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: selected == index ? Constant.grey : Constant.accentDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor:
              selected == index ? Constant.accentDark : Constant.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: BorderSide(width: 1, color: Constant.accentDark),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        radioTheme: RadioThemeData(
          fillColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
        ),
      ),
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
                        Tab_bar(title: "RANDEVU OLUŞTUR"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: height * 0.35,
                            child: Container(
                              decoration: _cardContaier,
                              child: SfCalendar(
                                controller: _controller,
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
                                    date = details.date;
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
                            child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "09:00", 0))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                              height: height * 0.08,
                                              child: customRadio("09:30", 1))),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "10:00", 2))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "10:30", 3))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "11:00", 4))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "11:30", 5))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "13:00", 6))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                              height: height * 0.08,
                                              child: customRadio("13:30", 7))),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "14:00", 8))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "14:30", 9))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "15:00", 10))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "15:30", 11))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                    height: height * 0.08,
                                                    child: customRadio(
                                                        "13:00", 12))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                              height: height * 0.08,
                                              child: customRadio("16:30", 13))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        Container(
                          color: Constant.accentDark.withOpacity(0),
                          padding:
                              EdgeInsets.only(bottom: 15, left: 8, right: 8),
                          // padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width * 1,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RandevOlusturTwo(deneme, dateTwo)));
                                //Grock.to(bekleyenRandevular());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Constant.green,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10),
                                  )),
                              child: Text(
                                "Devam Et",
                                style: TextStyle(
                                  color: Constant.darkWhite,
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 30,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ),
                          ),
                        )
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
