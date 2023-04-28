// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, file_names

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme:ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.amber,
//         fontFamily: 'Poppins',
//         /*textTheme:const TextTheme(
//           headline1: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
//           headline6: TextStyle(fontSize:36.0,fontStyle: FontStyle.italic),
//           bodyText2: TextStyle(fontSize:12.0,fontFamily: 'Hind')//Scaffol gövdesindekiler bundan etkilenir.

//         ),*/
//       ),
//         home: Scaffold(
//           appBar: AppBar(title: Text("APP BAR")),
//       body: AnaEkran(),
//     ));
//   }
// }

// class AnaEkran extends StatelessWidget {
//   AnaEkran({super.key});

//   var snackBar = SnackBar(
//       content: Text("TEBRİKLER SNACK BARI AÇTIN ASKO"),
//       action: SnackBarAction(
//         label: 'SNACKBARI KAPAT',
//         onPressed: () {},
//       ));

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//           child: Center(
//             child: Column(
//         children: [
//             ElevatedButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 },
//                 child: Text("SNACK BARI AÇ")),
//             Text("TEMA DENEME",/*style:Theme.of(context).textTheme.headline6,*/),
//             Text("TEMA DENEME2",style: TextStyle(fontFamily:' Roboto'),/*style:Theme.of(context).textTheme.headline6,*/)

//         ],
//       ),
//           )),
//     );
//   }
// }
