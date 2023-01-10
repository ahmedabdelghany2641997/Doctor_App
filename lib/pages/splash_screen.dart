import 'dart:async';

import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/pages/admin_login.dart';
import 'package:doctor_app1/pages/choice_Screen.dart';
import 'package:doctor_app1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
 String? finalEmail;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationDate().whenComplete(() async{
      Timer(const Duration(seconds: 5), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) =>
               finalEmail ==null?ChoiceScreen(): HomePage() ), (route) => false);
      });

    });


    super.initState();
  }
  Future getValidationDate()async{

    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
   var obtainedEmail =sharedPreferences.getString('email');
   setState(() {
     finalEmail=obtainedEmail;
   });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [pColor.withOpacity(0.8), pColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/images/doctors.png"),
          ),
          const SizedBox(
            height: 50,
          ),
           Text(
            '${getLang(context, "Doctor online")}'
            ,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
              decorationColor: pColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
           Text(
    '${getLang(context, "Appoint Your Doctor")}',
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500,decorationColor: pColor),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {

              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (_) => ChoiceScreen()), (route) => false);


            },
            style: ElevatedButton.styleFrom(
                backgroundColor: wColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child:  Text(
              '${getLang(context, "Lets Go")}',
              style: const TextStyle(
                  color: pColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )),

          const SizedBox(
            height: 60,
          ),
          Image.asset("assets/images/x.png",color: wColor,scale: 2,),

        ],
      ),
    );

    // return Scaffold(
    //   body: SizedBox(
    //     height: double.infinity,
    //     child: Hero(
    //       tag: "doc",
    //       child:Image.asset("assets/images/doc2.jpg",fit: BoxFit.fill),
    //
    //     ),
    //
    //   ),
    //
    //
    // );
  }
}
