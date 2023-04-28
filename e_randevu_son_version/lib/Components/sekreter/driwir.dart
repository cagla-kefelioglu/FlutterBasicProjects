// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';


import '../../Constant/constant.dart';
import '../../View/CommonScreens/login.dart';
import '../../View/Rektor_screen/randevuOlustur.dart';
import '../../View/Rektor_screen/randevular.dart';
import '../../View/Sekreter_screen/bekleyenRandevu.dart';
import '../../View/Sekreter_screen/guncellenenRandevular.dart';
import '../../View/Sekreter_screen/sekreterAltBirim.dart';
import '../../View/Sekreter_screen/sekreterTatil.dart';
import '../../View/Sekreter_screen/sonuclananRandevular.dart';
import '../DrawerButton.dart';

class SekreterDriwirComponents extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _SekreterDriwirComponentsState();
}

class _SekreterDriwirComponentsState extends State<SekreterDriwirComponents> {
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
          child: ListView(children: [
            SizedBox(
              width: width * 1,
              height: height * 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom:20.0),
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
                            children: [IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.close , size: 38,color: Constant.darkWhite,))],
                          ),
                        )),
                    SizedBox(
                      height: height * 0.6,
                      child: Column(
                        
                        children: [
                          DrawerButton(
                            text: "Randevu Oluştur",
                            onTap: () {
                              return Grock.to(randevuOlustur());
                            },
                          ),
                            DrawerButton(
                            text: "Sonuçlanan Randevular",
                            onTap: () {
                              return Grock.to(sonuclananRandevular());
                            },
                          ),
                          DrawerButton(
                            text: "Bekleyen Randevular",
                            onTap: () {
                              return Grock.to(bekleyenRandevular());
                            },
                          ),
                             DrawerButton(
                            text: "Güncellenen Randevular",
                            onTap: () {
                              return Grock.to(guncellenenRandevular());
                            },
                          ),
                          DrawerButton(
                            text: "Tatil Planı Oluştur",
                            onTap: () {
                              return Grock.to(SekreterTatilPlani());
                            },
                          ),
                          DrawerButton(
                            text: "Diğer Birimler",
                            onTap: () {
                              return Grock.to(SekreteraltBirim());
                            },
                          ),
                        
                       
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height*0.1,
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
            )
          ]
           
      
              ),
        ),
      ),
    );
  }
}