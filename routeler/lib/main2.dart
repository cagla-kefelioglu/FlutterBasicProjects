// ignore_for_file: unused_import, camel_case_types, deprecated_member_use, prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers, unnecessary_new


import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(contex)=> GirisEkrani(),
        "/profil":(contex)=> profilEkrani(),
      },
    );
    
      }
}


class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();
girisYap(){
if(t1.text=="admin" && t2.text=="1234"){
  Navigator.pushNamed(context,"/profil",arguments:veriModeli(kullaniciAdi:t1.text, sifre:t2.text));
}
else{
showDialog(context: context, builder: (BuildContext context){
  return AlertDialog(
    title: new Text("Yanlış kullanıcı adı veya şifre"),
    content: new Text("Lütfen Giriş Bilgilerinizi Gözden Geçirin !"),

    actions: [
      new TextButton(
        onPressed:(){Navigator.of(context).pop();} , child:Text("Kapat"))
    ],
  );
}


);
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Giriş ekranı")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(children: [
            TextFormField(controller: t1,decoration:InputDecoration(hintText:"Kullanıcı Adı"),),
            TextFormField(controller: t2,decoration: InputDecoration(hintText: "Şifre"),),

            ElevatedButton(onPressed:girisYap,child: Text("Giriş Yap"),),
          ],),
        ),
      ),
    );
  }
}



class profilEkrani extends StatefulWidget {
  const profilEkrani({Key? key}) : super(key: key);

  @override
  State<profilEkrani> createState() => _profilEkraniState();
}

class _profilEkraniState extends State<profilEkrani> {

cikisYap(){
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {

 
  //final veriModeli iletinenler = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title:const Text("profil ekranı"),),
      body:Container(
        child: Column(children: [
          ElevatedButton(onPressed:cikisYap,child: Text("Çıkış Yap"),),
          Text("iletinenler.kullaniciAdi"),
          Text("iletinenler.sifre"),
        ]
        ),
      ),
    );
  }
}

class veriModeli{
String kullaniciAdi , sifre;
veriModeli({required this.kullaniciAdi,required this.sifre});

}