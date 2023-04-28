// ignore_for_file: unused_import, prefer_const_constructors, file_names, prefer_final_fields, avoid_unnecessary_containers, avoid_print, unused_field, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_new, unused_element, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../Components/TabBar/tab_bar_components.dart';
import '../../Components/popup/sekreterTatilOnay.dart';
import '../../Components/popup/tatil.dart';
import '../../Components/rektör/driwir_components.dart';
import '../../Components/sekreter/driwir.dart';
import '../../Constant/constant.dart';
import '../../assets.dart';

class SekreterTatilPlani extends StatefulWidget {
  

  @override
  State<SekreterTatilPlani> createState() => _SekreterTatilPlaniState();
}

class _SekreterTatilPlaniState extends State<SekreterTatilPlani> {
  ValueNotifier<String> _dateStart = ValueNotifier("");
  ValueNotifier<String> _dateEnd = ValueNotifier("");

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs
          dateRangePickerSelectionChangedArgs) async {
    if (DateTime.now().year <
        dateRangePickerSelectionChangedArgs.value.startDate.year) {
      setState(() {
        String inputFormat = DateFormat('dd/MM/yyyy')
            .format(dateRangePickerSelectionChangedArgs.value.startDate);
        var startdate = inputFormat.toString();
        List<String> startdateList = startdate.split(" ");
        _dateStart.value = startdateList[0];
        inputFormat = DateFormat('dd/MM/yyyy')
            .format(dateRangePickerSelectionChangedArgs.value.endDate);
        var enddate = inputFormat.toString();
        List<String> enddateList = enddate.split(" ");
        _dateEnd.value = enddateList[0];

        print("${_dateStart.value} , ${_dateEnd.value}");
      });
    } else if (DateTime.now().year ==
        dateRangePickerSelectionChangedArgs.value.startDate.year) {
      if (DateTime.now().month <
          dateRangePickerSelectionChangedArgs.value.startDate.month) {
        setState(() {
          String inputFormat = DateFormat('dd/MM/yyyy')
              .format(dateRangePickerSelectionChangedArgs.value.startDate);
          var startdate = inputFormat.toString();
          List<String> startdateList = startdate.split(" ");
          _dateStart.value = startdateList[0];
          inputFormat = DateFormat('dd/MM/yyyy')
              .format(dateRangePickerSelectionChangedArgs.value.endDate);
          var enddate = inputFormat.toString();
          List<String> enddateList = enddate.split(" ");
          _dateEnd.value = enddateList[0];

          print("${_dateStart.value} , ${_dateEnd.value}");
        });
      } else if (DateTime.now().month ==
          dateRangePickerSelectionChangedArgs.value.startDate.month) {
        if (DateTime.now().day <=
            dateRangePickerSelectionChangedArgs.value.startDate.day) {
          setState(() {
            String inputFormat = DateFormat('dd/MM/yyyy')
                .format(dateRangePickerSelectionChangedArgs.value.startDate);
            var startdate = inputFormat.toString();
            List<String> startdateList = startdate.split(" ");
            _dateStart.value = startdateList[0];
            inputFormat = DateFormat('dd/MM/yyyy')
                .format(dateRangePickerSelectionChangedArgs.value.endDate);
            var enddate = inputFormat.toString();
            List<String> enddateList = enddate.split(" ");
            _dateEnd.value = enddateList[0];

            print("${_dateStart.value} , ${_dateEnd.value}");
          });
        } else {
          dateRangePickerSelectionChangedArgs.value.startDate = null;
          dateRangePickerSelectionChangedArgs.value.endDate = null;
        }
      } else {
        dateRangePickerSelectionChangedArgs.value.startDate = null;
        dateRangePickerSelectionChangedArgs.value.endDate = null;
      }
    } else {
      dateRangePickerSelectionChangedArgs.value.startDate = null;
      dateRangePickerSelectionChangedArgs.value.endDate = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       /*localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
            const Locale('tr'),
           
        ],
        locale: const Locale('tr'),*/
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
                             child: Padding(
                               padding: const EdgeInsets.only(bottom: 20.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Tab_bar(title: "TATİL PLANI"),
                                   Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: SizedBox(
                                         height: height * 0.40,
                                           child: Container(
                                               //decoration: _cardContaier,
                                               child: SfDateRangePicker(
                                                
                                                 
                                   headerStyle: DateRangePickerHeaderStyle(
                                       textAlign: TextAlign.center,
                                       backgroundColor: Constant.cardColor,
                                       textStyle: TextStyle(
                                           fontSize: 20,
                                           fontFamily: 'PoppinsBold',
                                           color: Constant.darkWhite,
                                           fontWeight: FontWeight.w500)),
                                           /*  cellBuilder: (BuildContext context,DateRangePickerCellDetails details) {
                                               final bool isToday =
                                                   isSameDate(details.date,
                                                       DateTime.now());
                                              
                                              
                                               return Container(
                                                 alignment: Alignment.center,
                                                 margin: EdgeInsets.all(2),
                                                 
                                                 decoration: BoxDecoration(
                                                   boxShadow: [
                                                     BoxShadow(
                                                       color: Colors.white
                                                           .withOpacity(1),
                                                       spreadRadius: 0,
                                                       blurRadius: 8,
                                                       offset: Offset(-4,
                                                           -4), // changes position of shadow
                                                     ),
                                                     BoxShadow(
                                                       color: Constant
                                                           .shadowGrey,
                                                       spreadRadius: 0,
                                                       blurRadius: 8,
                                                       offset: Offset(4,
                                                           4), // changes position of shadow
                                                     ),
                                                   ],
                                                   color:
                                                       Constant.darkWhite,
                                                   border: isToday
                                                       ? Border.all(
                                                           color: Constant
                                                               .dark,
                                                           width: 1)
                                                       : null,
                                                   borderRadius:
                                                       BorderRadius
                                                           .circular(10),
                                                 ),
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   mainAxisAlignment:
                                                       MainAxisAlignment
                                                           .center,
                                                   children: <Widget>[
                                                     Text(
                                                       details.date.day
                                                           .toString(),
                                                       style: TextStyle(
                                                         fontSize: 13,
                                                         fontWeight:
                                                             FontWeight
                                                                 .bold,
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               );
                                             },
                                             */initialDisplayDate:
                                                 DateTime.now(),
                                             view:
                                                 DateRangePickerView.month,
                                                  backgroundColor:Constant.darkWhite,
                                                 
                                             monthViewSettings:
                                                 DateRangePickerMonthViewSettings(
                                                     firstDayOfWeek: 1),
                                             selectionMode:
                                                 DateRangePickerSelectionMode
                                                     .range,
                                                     startRangeSelectionColor: Constant.dark,
                                                     endRangeSelectionColor: Constant.dark,
                                                     rangeSelectionColor:Constant.dark,
                                                 //rangeSelectionRadius: 10,
                                                 rangeTextStyle: TextStyle(color: Constant.darkWhite),
                                             onSelectionChanged:
                                                 _onSelectionChanged,
                                           )))
                                           
                                       ),
                                  
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               left: 8.0,
                                               right: 8.0,
                                               bottom: 2.0),
                                           child: Container(
                                               height: height * 0.035,
                                               width: width * 1,
                                               decoration: BoxDecoration(
                                                 border: Border(
                                                   bottom: BorderSide(
                                                     color: Constant.dark,
                                                     width: 1.0,
                                                   ),
                                                 ),
                                               ),
                                               child: Text(
                                                 "Başlangıç tarihi : ${_dateStart.value}",
                                                 style: _titleStyle,
                                               )),
                                         ),
                                         SizedBox(
                                           height: 15,
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               left: 8.0,
                                               right: 8.0,
                                               bottom: 2.0),
                                           child: Container(
                                               height: height * 0.035,
                                               width: width * 1,
                                               decoration: BoxDecoration(
                                                 border: Border(
                                                   bottom: BorderSide(
                                                     color: Constant.dark,
                                                     width: 1.0,
                                                   ),
                                                 ),
                                               ),
                                               child: Text(
                                                 "Bitiş tarihi : ${_dateEnd.value}",
                                                 style: _titleStyle,
                                               )),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: SizedBox(
                                       width: width * 1,
                                       height: 60,
                                       child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                               backgroundColor: Constant.green,
                                               shape:
                                                   new RoundedRectangleBorder(
                                                 borderRadius:
                                                     new BorderRadius.circular(
                                                         10),
                                               )),
                                           onPressed: () {
                                             _openDialog(context);
                                           },
                                           child: Text(
                                             "Tatili Onayla",
                                             style: TextStyle(
                                               color: Constant.darkWhite,
                                               fontFamily: 'PoppinsBold',
                                               fontSize: 30,
                                               letterSpacing: 0.7,
                                             ),
                                           )),
                                     ),
                                   )
                                 ],
                               ),
                             ))
                    ]))
          ],
        ),
      )),
    );
  }



  bool isSameDate(DateTime date, DateTime dateTime) {
    if (date.year == dateTime.year &&
        date.month == dateTime.month &&
        date.day == dateTime.day) {
      return true;
    }

    return false;
  }



  TextStyle _titleStyle = TextStyle(
      //overflow: TextOverflow.ellipsis,

      fontFamily: 'Poppins',
      fontSize: 15,
      color: Constant.dark,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);
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

Future _openDialog(context) => showDialog(
    barrierDismissible: false,
    barrierColor: Constant.popat,
    context: context,
    builder: ((context) => SekreterTatilOnay()));
