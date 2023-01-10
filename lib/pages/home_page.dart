import 'package:doctor_app1/colors/colors.dart';
import 'package:doctor_app1/colors/hexa_color.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/componends/componend.dart';
import 'package:doctor_app1/models/doctor.dart';
import 'package:doctor_app1/pages/Reservation_screen.dart';
import 'package:doctor_app1/pages/about_us_screen.dart';
import 'package:doctor_app1/pages/contact_us_screen.dart';
import 'package:doctor_app1/pages/detail_Page.dart';
import 'package:doctor_app1/pages/news_screen.dart';
import 'package:doctor_app1/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sign_in_button/sign_in_button.dart';

enum But {
  email,
  google,
  facebook,
  gitHub,
  apple,
  linkedIn,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> _hDoctors = <Doctor>[];


  final List<String> imageList = [
    'assets/images/doc.jpg',
    'assets/images/doc.jpg',
    'assets/images/doc.jpg'
  ];

  /// **********************************************
  /// ACTIONS
  /// **********************************************
  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailPage(
                doctor: doctor,
              ),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _hDoctors = _getHDoctors();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: SingleChildScrollView(

        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

            /// slider photo
            CarouselSlider(
              options: CarouselOptions(
                  height: 180.0, initialPage: 0, autoPlay: true),
              items: imageList.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 25,
            ),

            /// info doctor
            _hDoctorsSection(),
            const SizedBox(
              height: 15,
            ),

            /// aveilable time
            timeSlotWidget(),
            timeSlotWidget(),
            timeSlotWidget(),
            timeSlotWidget(),

            /// social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.facebook,
                  mini: true,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.gitHub,
                  mini: true,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.linkedIn,
                  mini: true,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.linkedIn,
                  mini: true,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.linkedIn,
                  mini: true,
                  onPressed: () {},
                ),

              ],
            ),



          ],
        ),
      ),

      /// drawer links
      drawer: const NavigationDrawer(),




    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  AppBar _buildAppBar() {
    return AppBar(

      backgroundColor: Colors.white38,
      elevation: 0,
      iconTheme: IconThemeData(color: HexColor('#150047')),

      actions: [

        FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
          mini: true,


          onPressed: ()=> Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Reservation(),)),
          child: const Icon(Icons.person_add_alt),
        ),

        // IconButton(
        //   icon: const Icon(
        //     Icons.search,
        //     size: 25,
        //   ),
        //   onPressed: () {},
        // ),
      ],
    );
  }

  /// Highlighted Doctors Section
  SizedBox _hDoctorsSection() {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _hDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
        const Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) =>
            HDCell(
              doctor: _hDoctors[index],
              onTap: () => _onCellTap(_hDoctors[index]),
            ),
      ),
    );
  }

  /// Get Highlighted Doctors List
  List<Doctor> _getHDoctors() {
    List<Doctor> hDoctors = <Doctor>[];

    hDoctors.add(Doctor(
      firstName: '${getLang(context, "Albert")}',
      lastName: '${getLang(context, "Alexander")}',
      image: 'albert.png',
      type: '${getLang(context, "Kidney")}',
      rating: 4.5,
    ));
    hDoctors.add(Doctor(
      firstName: '${getLang(context, "Elisa")}',
      lastName: '${getLang(context, "Rose")}',
      image: 'albert.png',
      type: '${getLang(context, "Kidney")}',
      rating: 5,
    ));

    hDoctors.add(Doctor(
      firstName: '${getLang(context, "Ahmed")}',
      lastName: '${getLang(context, "Abdelghany")}',
      image: 'albert.png',
      type: '${getLang(context, "Kidney")}',
      rating: 3.5,
    ));

    hDoctors.add(Doctor(
      firstName: '${getLang(context, "Ali")}',
      lastName: '${getLang(context, "Said")}',
      image: 'albert.png',
      type: '${getLang(context, "Kidney")}',
      rating: 4,
    ));

    return hDoctors;
  }

  /// Available time for doctor
  Container timeSlotWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: docContentBgColor),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: dateBgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "5",
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '${getLang(context, "MAY")}',
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                 Text(
            '${getLang(context, "Consultation")}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                 Text(
                     '${getLang(context, "Sunday 9 am to 11.30 am")}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}


