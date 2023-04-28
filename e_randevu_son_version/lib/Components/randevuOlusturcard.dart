// // ignore_for_file: unused_import, file_names, duplicate_import, prefer_const_constructors, must_be_immutable, unused_local_variable, non_constant_identifier_names, use_key_in_widget_constructors, avoid_print, curly_braces_in_flow_control_structures, sized_box_for_whitespace, unused_field

// import 'package:flutter/material.dart';
// import 'package:grock/grock.dart';
// import 'package:grock/grock.dart';
// import 'package:randevu_deneme/Constant/constant.dart';

// class Saat extends StatefulWidget {
//   String text;
//   Saat({
//     this.text,
//   });

//   @override
//   State<Saat> createState() => _SaatState();
// }

// class _SaatState extends State<Saat> {
//   TextEditingController text_one = TextEditingController();

//   bool _flag = true;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       height: height * 0.08,
//       child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//               _flag ? Constant.grey : Constant.accentDark,
//             ),
//             shape: MaterialStateProperty.all<OutlinedBorder>(
//                 RoundedRectangleBorder(
//                     side: BorderSide(width: 1.0, color: Constant.accentDark),
//                     borderRadius: BorderRadius.circular(12.0))),
//             overlayColor: MaterialStateProperty.resolveWith<Color>(
//               (Set<MaterialState> states) {
//                 if (states.contains(MaterialState.pressed))
//                   return Constant.accentDark.withOpacity(0.5); //<-- SEE HERE
//                 return null; // Defer to the widget's default.
//               },
//             ),
//           ),
//           onPressed: () {
//             setState(() => _flag = !_flag);
//             print(widget.text);
//           } ,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(widget.text,
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 20,
//                     color: _flag ? Constant.accentDark : Constant.grey,
//                     fontWeight: FontWeight.w500,
//                   ))
//             ],
//           )),
//     );
//   }
// }
