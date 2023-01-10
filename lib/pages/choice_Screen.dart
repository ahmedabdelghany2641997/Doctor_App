import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/colors/painter_bottom.dart';
import 'package:doctor_app1/colors/painter_top.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/pages/admin_login.dart';
import 'package:doctor_app1/pages/home_page.dart';
import 'package:flutter/material.dart';

class ChoiceScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 260,
            child: CustomPaint(
              painter: CustomPainterTop(),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                fixedSize: const Size(200, 50),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                elevation: 5,
                shadowColor: wColor,
                backgroundColor: Colors.deepOrange[200],
                side: const BorderSide(color: Colors.black87, width: 2),
                shape: const StadiumBorder()),
            child:  Text(

              '${getLang(context, "USER")}',
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          )),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false);
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                fixedSize: const Size(200, 50),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                elevation: 5,
                shadowColor: wColor,
                backgroundColor: Colors.lightBlue,
                side: const BorderSide(color: Colors.black87, width: 2),
                shape: const StadiumBorder()),
            child:  Text(
              '${getLang(context, "Admin")}',
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          )),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 260,
              child: CustomPaint(
                painter: CustomPainterBottom(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height,
// padding: const EdgeInsets.all(20),
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [pColor.withOpacity(0.8), pColor],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// ),

///////////////////////////////////
