// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constant/constant.dart';
import '../assets.dart';
import 'rektör/driwir_components.dart';

class Yan_bar extends StatelessWidget {

final GlobalKey<ScaffoldState> scaffoldKeyy ;


  Yan_bar({ this.scaffoldKeyy});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DriwirComponents(),
      body:Container(
                  width: width * 0.2,
                  height: height * 1,
                  color: Constant.dark,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.06),
                    child: Column(                     
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(Assets.icons.menuuSVG,width: 33),
                          onPressed: () {
                            scaffoldKeyy.currentState?.openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ],
                    ),
                  ),
                ),
              
    );
  }
}