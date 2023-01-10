import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/componends/componend.dart';
import 'package:doctor_app1/pages/patient_data_sreen.dart';
import 'package:flutter/material.dart';

class PatientDisease extends StatefulWidget {
  @override
  State<PatientDisease> createState() => PatientDiseaseState();
}

class PatientDiseaseState extends State<PatientDisease> {
  bool eyes = false;
  bool heart = false;
  bool stomach = false;
  bool brain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Spacer(),
          CheckboxListTile(
            title:  Text('${getLang(context, "eyes")}'),
            value: eyes,
            onChanged: (bool? value) {
              setState(() {
                eyes=value!;
              });
            },
            activeColor: Colors.green,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            tileColor: Colors.white70,

          ),
          const SizedBox(height: 10,),
          CheckboxListTile(
            title:  Text('${getLang(context, "Heart")}'),
            value: heart,
            onChanged: (bool? value) {
              setState(() {
                heart=value!;
              });
            },
            activeColor: Colors.green,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            tileColor: Colors.white70,

          ),
          const SizedBox(height: 10,),
          CheckboxListTile(
            title:  Text('${getLang(context, "stomach")}'),
            value: stomach,
            onChanged: (bool? value) {
              setState(() {
                stomach=value!;
              });
            },
            activeColor: Colors.green,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            tileColor: Colors.white70,

          ),
          const SizedBox(height: 10,),
          CheckboxListTile(
            title:  Text('${getLang(context, "brain")}'),
            value: brain,
            onChanged: (bool? value) {
              setState(() {
                brain=value!;
              });
            },
            activeColor: Colors.green,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            tileColor: Colors.white70,

          ),
          const SizedBox(height: 25,),
          // ignore: sized_box_for_whitespace
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: wColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child:  Text(
              '${getLang(context, "Apply")}',
              style: const TextStyle(
                  color: pColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
  const Spacer(),

          Container(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => PatientData()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: wColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child:  Text(
                '${getLang(context, "Next")}',
                style: const TextStyle(
                    color: pColor, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
