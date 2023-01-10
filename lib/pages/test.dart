import 'package:doctor_app1/componends/applocal.dart';
import 'package:flutter/material.dart';

class a extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>HomeState();



}
class HomeState extends State<a>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('مرحبا'),

     ),
     body: Container(child: Text("${getLang(context, "welcome")}"),),
   );
  }


}