import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/pages/patient_disease_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Reservation extends StatefulWidget {
  const Reservation

  ({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Reservation> createState() => ReservationState();
}

class ReservationState extends State<Reservation> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black54),
            ),

            child: Text(

              '${dateTime.year}/${dateTime.month}/${dateTime.day}_${dateTime
                  .hour}:${dateTime.minute}',
              style: const TextStyle(fontSize: 50,color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate:DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2024),
              );
              if (newDate == null) return;

              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime:
                TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
              );
              if (newTime == null) return;

              final  newDateTime = DateTime(
                newDate.day, newDate.month,  newDate.year,
                  newTime.hour, newTime.minute,);
              setState(() {
              // ignore: unnecessary_this
              this.dateTime = newDateTime;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: wColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child:  Text(
              '${getLang(context, "Select date & time")}',
              style: const TextStyle(
                  color: pColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(

              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => PatientDisease()),
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
