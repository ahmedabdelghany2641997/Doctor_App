import 'package:doctor_app1/componends/applocal.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${getLang(context, "welcome")}')),

    );
  }


}