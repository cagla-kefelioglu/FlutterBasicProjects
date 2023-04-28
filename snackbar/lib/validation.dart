// ignore_for_file: unused_import, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FORM VALİDATİON")),
        body: FormPage(),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();
  FocusNode nesne=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: true,
            onFieldSubmitted: (deger)=>nesne.requestFocus(),
            validator: (deger) {
              if (deger!.isEmpty) {
                return "Kullanıcı adi girin !";
              }
              else {
                return null;
              }
            },
          ),
          TextFormField(
            focusNode: nesne,
             validator: (deger) {
              if (deger!.length<6) {
                return "Şifre en az 6 haneli olmalıdır !";
              }
              else {
                return null;
              }
            },
          ),
          ElevatedButton(onPressed: () {
            if(_formkey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("bilgiler kaydedildi")));
            }
          }, child: Text("onayla"))
        ],
      ),
    );
  }
}
