// // ignore_for_file: unused_import, deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable


// import 'package:flutter/material.dart';

// void main()=>runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:AnaSayfa(),
//     );
//   }
// }

// class AnaSayfa extends StatefulWidget {
//   const AnaSayfa({Key? key}) : super(key: key);

//   @override
//   State<AnaSayfa> createState() => _AnaSayfaState();
// }

// class _AnaSayfaState extends State<AnaSayfa> {
//   TextEditingController text1=TextEditingController();
//   TextEditingController text2=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         child: Container(
//           child: Column(children: [
//            const Text("GİRİŞ SAYFASI"),
//            TextFormField(controller: text1,decoration:InputDecoration(hintText: "Kullanici adi"),),
//            TextFormField(controller: text2,decoration: InputDecoration(hintText: "Şifre"),),
//             ElevatedButton(child:const Text("PROFİL SAYFASINA GİT"),onPressed: (){
//               Navigator.push(context, 
//               MaterialPageRoute(builder:(context) =>ProfilSayfasi(kullaniciAdi: text1.text,sifre: text2.text,) )
//               );
//             })
//           ],)
            
        
//         ),
//       ),
//     );
//   }
// }

// class ProfilSayfasi extends StatefulWidget {
//   String kullaniciAdi ,sifre;
//   ProfilSayfasi({required this.kullaniciAdi,required this.sifre});
//   @override
//   State<ProfilSayfasi> createState() => _ProfilSayfasiState();
// }

// class _ProfilSayfasiState extends State<ProfilSayfasi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Column(children: [
//             Text("PROFİL SAYFASI"),
//             Text(widget.kullaniciAdi),
//             Text(widget.sifre),
//             ElevatedButton(child: Text("Ana Sayfaya Dön"),onPressed: (){Navigator.of(context).pop();})
//           ]),
//         ),
//       ),
//     );
//   }
// }