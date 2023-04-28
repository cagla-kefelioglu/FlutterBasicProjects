// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../Constant/constant.dart';


class Titlee extends StatelessWidget {
  
  var title;

  Titlee({this.title});

  @override
  Widget build(BuildContext context) {
 final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return     Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
        padding: EdgeInsets.only( right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Bebas',
                            color: Constant.dark,
                            letterSpacing: 2,
                            decoration: TextDecoration.none),
                            
                      ),
                      SizedBox(
                        width: width * 0.9,
                        height: 1,
                        child: Container(color: Constant.beige),
                      )
                    ],
                  ),
                )
              ],
            );
         
  }
}