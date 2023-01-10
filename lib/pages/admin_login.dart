
import 'package:doctor_app1/colors/cliper.dart';
import 'package:doctor_app1/colors/cliper2.dart';
import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Widget _buildEmail() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return'${getLang(context, "Enter Your Email")}';
            }
            return null;
          },
          controller: emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.lock_outline_rounded),
            hintText: 'Enter Your Email',
          ),
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return'${getLang(context, "Enter Your Password")}';
            }
            return null;
          },
          controller: passwordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.email_outlined),
            hintText: "Enter Your Password",
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 300),
                  painter: RPSCustomPainter(),
                ),
                Positioned(
                  top: 16,
                  right: -5,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 300),
                    painter: PSCustomPainter(),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        '${getLang(context, "Login")}',
                        style:
                            const TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${getLang(context, "Please sign in to continue")}',
                        style:
                            const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  _buildEmail(),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildPassword(),
                  const SizedBox(
                    height: 25,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () async{

                      final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', emailController.text);
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (_) => HomePage()),
                      //         (route) => false);


                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffca148),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child:  Text(
                      '${getLang(context, "Login")}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
