// ignore_for_file: camel_case_types, implementation_imports, prefer_const_constructors, unnecessary_new, unused_import, file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

import '../../Components/ALtBirimler/AltBirimCard.dart';
import '../../Components/TabBar/title.dart';
import '../../Components/rektör/driwir_components.dart';
import '../../Components/TabBar/tab_bar_components.dart';
import '../../Constant/constant.dart';
import '../../assets.dart';



class altBirim extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _altBirimState();
}

class _altBirimState extends State<altBirim> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: 
            Column(
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
                          Tab_bar(title: "SEKRETER"),
                          //LİstView.sperated kullanılacak asko :)
                          Expanded(
                            child: _altBirimList(),
                          ),
                          Titlee(title: "KONTROLÖR"),
                          Expanded(
                            child: _altBirimList(),
                          ),
                        ]),
                  )
                ],
              ),
            )
          ],
        )),
      );
  }

  ListView _altBirimList() {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) {
          return AltBirirmcard();
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: 3);
  }
}
