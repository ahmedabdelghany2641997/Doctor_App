import 'package:doctor_app1/colors/hexa_color.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/models/doctor.dart';
import 'package:doctor_app1/pages/about_us_screen.dart';
import 'package:doctor_app1/pages/contact_us_screen.dart';
import 'package:doctor_app1/pages/home_page.dart';
import 'package:doctor_app1/pages/news_screen.dart';
import 'package:doctor_app1/pages/splash_screen.dart';
import 'package:flutter/material.dart';





/// container doctor

class HDCell extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;

  const HDCell({
    Key? key,
    required this.doctor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => onTap(),
      child: Container(
        width: 283,
        height: 199,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: HexColor('#00C6AD'),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 16,
              right: 16,
              child: SizedBox(
                width: 162,
                height: 139,
                child: Image(
                  image: AssetImage('assets/images/bg_shape.png'),
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${getLang(context, "Dr.")}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    doctor.firstName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    doctor.lastName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    doctor.type + " ${getLang(context, "Specialist")}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 77,
                height: 54,
                decoration: BoxDecoration(
                  color: HexColor('#00A994'),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(32)),
                ),
                child: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 0,
              child: SizedBox(
                width: 120,
                height: 173,
                child: Hero(
                  tag: doctor.firstName + doctor.lastName,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    image: AssetImage('assets/images/' + doctor.image),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/// Drawer Widget

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItms(context),

        ],

      ),),

    );
  }

  buildHeader(BuildContext context) =>
      Container(
        padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top,
        ),

      );

  buildMenuItms(BuildContext context) =>
      Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 16,
          children: [

            ListTile(
              leading: const Icon(Icons.home_outlined),
              title:  Text('${getLang(context, "Home")}'),
              onTap:()=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage(),)),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title:  Text('${getLang(context, "News")}'),
              onTap:()=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => News(),)),
            ), ListTile(
              leading: const Icon(Icons.article),
              title:  Text('${getLang(context, "About Us")}'),
              onTap:()=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AboutUs(),)),
            ),
            ListTile(
              leading: const Icon(Icons.contact_support_outlined),
              title:  Text('${getLang(context, "Contact Us")}'),
              onTap:()=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContactUs(),)),
            ),
            const Divider(color: Colors.black54,),

            ListTile(
              leading: const Icon(Icons.logout),
              title:  Text('${getLang(context, "Logout")}'),
              onTap:()=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SplashScreen(),)),
            ),

          ],

        ),
      );


}










