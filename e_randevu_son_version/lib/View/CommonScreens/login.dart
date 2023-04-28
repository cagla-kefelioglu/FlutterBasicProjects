// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_field, depend_on_referenced_packages, missing_required_param

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Constant/constant.dart';
import '../../assets.dart';
import '../Sekreter_screen/bekleyenRandevu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "",
      password = "",
      errorMessage = "Kullanıcı adı veya şifre hatalı";
  bool error = false, _passwordVisible = true, showprogress = false;
  var _username = TextEditingController();
  var _password = TextEditingController();

  void _login() async {
    setState(() {
      showprogress = true;
    });

    var url = Uri.https('canmuratakkoc.pythonanywhere.com', 'login');
    if (username != "" && password != "") {
      var response = await http.post(
        url,
        body: jsonEncode({'username': username, 'password': password}),
        headers: {"Content-type": "application/json", "charset": "UTF-8"},
      );
      if (response.statusCode == 200) {
        setState(() {
          error = false;
          showprogress = true;
          errorMessage = "";
        });
      } else {
        setState(() {
          error = true;
          showprogress = false;
          errorMessage = "Kullanıcı adı veya şifre hatalı";
        });
      }
    } else {
      setState(() {
        error = true;
        showprogress = false;
        errorMessage = "Tüm alanları doldurun";
      });
    }
  }

  @override
  void initState() {
    username = "";
    password = "";
    errorMessage = "";
    error = false;
    showprogress = false;
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Constant.dark,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 25.0, right: 12.0),
                    child: SizedBox(
                      width: width * 1,
                      height: height * 0.3,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -70,
                            child: Image.asset(
                              "assets/images/login_img.png",
                              width: width * 0.98,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.7,
                    width: width * 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constant.darkWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Fırat Üniversitesi",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontFamily: 'RobotoSlabSemibold',
                                          color: Constant.dark,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rektörlük Randevu Sistemi",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'RobotoSlabSemibold',
                                          color: Constant.dark,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.4,
                            child: Form(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width * 1,
                                      height: 60,
                                      child: Container(
                                        decoration: _boxDecoration,
                                        child: TextFormField(
                                          decoration: _fiedlDecoration,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 1,
                                      height: 60,
                                      child: Container(
                                        decoration: _boxDecoration,
                                        child: TextFormField(
                                          
                                          decoration: _fiedlDecoration.copyWith(
                                            labelText: "Kullanıcı Şifresi",
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 1,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //Grock.to(Randevular());
                                          Grock.to(bekleyenRandevular());
                                        },
                                        style: ElevatedButton.styleFrom(
                                             primary: Constant.green,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(10),
                                            )),
                                        child: Text(
                                          "Giriş Yap",
                                          style: TextStyle(
                                            color: Constant.darkWhite,
                                            fontFamily: 'PoppinsBold',
                                            fontSize: 30,
                                            letterSpacing: 0.7,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //Text("sjdhkshdksjgdfjshjd"),
                                  //Image.asset(Assets.images.red_logo,fit: BoxFit.contain,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 3 / 1,
                                        child: Image.asset(
                                          "assets/images/ddoLogo.png",
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _fiedlDecoration = InputDecoration(
      labelText: "Kullanıcı Adı",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 195, 23, 10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Constant.dark,
        ),
      ),
      filled: true, //backgroundu değişmek için true yapılır
      fillColor: Constant.grey, //background

      labelStyle: TextStyle(
        color: Constant.hinText,
        letterSpacing: 0.6,
        fontSize: 15,
        fontFamily: 'PoppinsBold',
      ));
  BoxDecoration _boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(-10, -10), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );
}
