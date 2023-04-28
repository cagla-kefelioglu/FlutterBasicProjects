// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';


import '../../Constant/constant.dart';
import '../../View/CommonScreens/login.dart';
import '../../View/Rektor_screen/altBirim.dart';
import '../../View/Rektor_screen/istekler.dart';
import '../../View/Rektor_screen/randevuOlustur.dart';
import '../../View/Rektor_screen/randevular.dart';
import '../../View/Rektor_screen/takvim.dart';
import '../../View/Rektor_screen/tatilPlanı.dart';
import '../DrawerButton.dart';

class DriwirComponents extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() => _DriwirComponentsState();
}

class _DriwirComponentsState extends State<DriwirComponents> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width * 1,
        height: height * 1,
        child: Drawer(
          backgroundColor: Constant.dark,
          child: SizedBox(
            width: width * 1,
            height: height * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: height * 0.1,
                    width: width * 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 38,
                                color: Constant.darkWhite,
                              ))
                        ],
                      ),
                    )),
                SizedBox(
                  height: height * 0.6,
                  child: Column(
                    children: [
                      DrawerButton(
                        text: "GÜNLÜK RANDEVULAR",
                        onTap: () {
                          return Grock.to(Randevular());
                        },
                      ),
                      DrawerButton(
                        text: "TÜM RANDEVULAR",
                        onTap: () {
                          return Grock.to(CalenderPages());
                        },
                      ),
                      DrawerButton(
                        text: "RANDEVU OLUŞTUR",
                        onTap: () {
                          return Grock.to(randevuOlustur());
                        },
                      ),
                      DrawerButton(
                        text: "ALT BİRİMLER",
                        onTap: () {
                          return Grock.to(altBirim());
                        },
                      ),
                      DrawerButton(
                        text: "TATİL PLANI OLUŞTUR",
                        onTap: () {
                          return Grock.to(TatilPlani());
                        },
                      ),
                      DrawerButton(
                        text: "RANDEVU İSTEKLERİ",
                        onTap: () {
                          return Grock.to(istekRandevular());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 1,
                        child: Image.asset(
                          "assets/images/ddyoLogo2.png",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
