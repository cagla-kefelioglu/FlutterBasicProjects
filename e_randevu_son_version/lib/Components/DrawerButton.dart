// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, file_names, unused_import, must_be_immutable, prefer_final_fields, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../Constant/constant.dart';

class DrawerButton extends StatelessWidget {
  Function onTap;
  String text;

  DrawerButton({ this.onTap,this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 1,
      child: Container(
        //margin: EdgeInsets.only(top: 1),
        child: SizedBox(
          width: width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 1,
                child: ElevatedButton(
                  onPressed: () => onTap(),
                  child: Text(
                    text,
                    style: _buttonText,
                  ),
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Constant.dark,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: prefer_const_constructors, unused_field
  TextStyle _buttonText = TextStyle(
    fontFamily: 'Bebas',
    fontSize: 35,
    color: Constant.darkWhite,
  );
}
