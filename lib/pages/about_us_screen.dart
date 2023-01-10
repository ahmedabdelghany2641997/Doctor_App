import 'package:flutter/material.dart';
import 'package:doctor_app1/componends/applocal.dart';


class AboutUs extends StatelessWidget{
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${getLang(context, "welcome")}'),
      ),
    );
  }


}