// // ignore_for_file: unused_import, prefer_const_constructors, file_names

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("DİSMİSSİBLE DENEME")),
//         body: AnaEkran(),
//       ),
//     );
//   }
// }

// class AnaEkran extends StatefulWidget {
//   const AnaEkran({super.key});

//   @override
//   State<AnaEkran> createState() => _AnaEkranState();
// }

// class _AnaEkranState extends State<AnaEkran> {
//   List ogeler = [
//     "Bir",
//     "iki",
//     "üç",
//     "dört",
//     "beş",
//     "altı",
//     "yedi",
//     "sekiz",
//     "dokuz",
//     "on"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: ogeler.length,
//       itemBuilder: (context, index) {
//         return Dismissible(
//           background:Container(color:Colors.red),
//           onDismissed: (direction){
//             setState(() {
//                ogeler.removeAt(index);//kaydırılan elemanı listeden çıkartır.
//                //setState kullanırız çünkü eleman çıkartınca indexlerin güncellenmesi gerekir.
//             });
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${index+1} numaralı eleman silindi")));
//           },
//           key:Key(ogeler[index]),
//           child: ListTile(
//             title: Text(ogeler[index]),
//           ),
//         );
//       },
//     );
//   }
// }
