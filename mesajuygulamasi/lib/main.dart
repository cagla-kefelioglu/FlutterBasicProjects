// // ignore_for_file: unused_import, deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Mesajlaşma Uygulaması",
//       home: Iskele(),
//     );
//   }
// }

// class Iskele extends StatelessWidget {
//   const Iskele({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mesajlaşma uygulaması arayüzü"),
//       ),
//       body: AnaEkrann(),
//     );
//   }
// }

// class AnaEkrann extends StatefulWidget {
//   const AnaEkrann({Key? key}) : super(key: key);

//   @override
//   State<AnaEkrann> createState() => _AnaEkrannState();
// }

// class _AnaEkrannState extends State<AnaEkrann> {
//   TextEditingController mesaj = TextEditingController();

//   List message = [];

//   mesajlariEkle(String metin) {
//     setState(() {
//       message.insert(0, metin);
//       mesaj
//           .clear(); //göndere basınca textfielda yazılan şey gider , orada kalmaz,silinir
//     });
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(30),
//       child: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: message.length,
//               itemBuilder: (context, indexNo) => Text(message[indexNo]),
//             ),
//           ),
//           Row(
//             children: [
//               Flexible(child:  TextField(
//                 onSubmitted: mesajlariEkle,
//                 controller: mesaj,
//                ),
//               ),
              
//               ElevatedButton(
//                 onPressed: ()=>mesajlariEkle(mesaj.text),
//                 child: const Text(
//                   "Gönder",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
