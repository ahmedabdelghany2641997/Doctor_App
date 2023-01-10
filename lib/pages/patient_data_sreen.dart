import 'dart:ffi';

import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:flutter/material.dart';

final _formkey =GlobalKey<FormState>();
class PatientData extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
  return Scaffold(



    body: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(

                  labelText: "Your Name",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Enter Name",
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person),

                ),
                validator: (value){

                  if(value ==null || value.isEmpty){

                    return'${getLang(context, "Enter Your Name")}';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.edit),

                  labelText: "Your Age",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Enter Age",
                  hintStyle: TextStyle(fontSize: 12),


                ),
                validator: (value){

                  if(value ==null || value.isEmpty){

                    return'${getLang(context, "Enter Your Age")}';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(

                decoration: const InputDecoration(

                  labelText: "Your Address",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Enter Address",
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.home_outlined),

                ),
                validator: (value){

                  if(value ==null || value.isEmpty){

                    return'${getLang(context, "Enter Your Address")}';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(

                  labelText: "Your Phone",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Enter Phone",
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.phone),

                ),
                validator: (value){

                  if(value ==null || value.isEmpty){

                    return'${getLang(context, "Enter Your Phone")}';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20,),
              ElevatedButton(

                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('${getLang(context, "Done!")}'),),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(

                    backgroundColor: wColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child:  Text(
                  '${getLang(context, "Save")}',
                  style: const TextStyle(
                      color: pColor, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),


            ],
          ),
        ),


      ),
    ),







  );

  }


}

