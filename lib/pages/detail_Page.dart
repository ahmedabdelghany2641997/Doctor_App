
import 'package:doctor_app1/colors/hexa_color.dart';
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/models/doctor.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Doctor doctor;

  const DetailPage({ Key? key, required this.doctor}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   ' ${getLang(context, "Dr.")}'+
                        widget.doctor.firstName +
                        ' ' +
                        widget.doctor.lastName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size: 14,
                        color: HexColor('#C6C6CD'),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                       "${getLang(context, "Melbourn")}','${getLang(context, "Australia")}",
                        style: TextStyle(
                          color: HexColor('#C6C6CD'),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: HexColor('#FFF9EA'),
                      border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.doctor.type + " ${getLang(context, "Specialist")}",
                      style: TextStyle(
                        color: HexColor('#FFBF11'),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${getLang(context, "Dr. Albert Alexanderis a Renal Physician who has comprehensive expertise in the fields of Renal Medicine and Internal Medicine. While Dr Ho specializes in dialysis and critical care nephrology, years of extensive training have also equipped him with skills to effectively handle a wide range of other kidney diseases, including kidney impairment, inflammation, infection and transplantation.")}',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(
                    height: 91,
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     DetailCell(title: '162', subTitle: 'Patients'),
                    //     DetailCell(title: '4+', subTitle: 'Exp. Years'),
                    //     DetailCell(title: '4273', subTitle: 'Rating'),
                    //   ],
                    // ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${getLang(context," Apart from kidney-related conditions, Dr Ho also offers care and consultation in various medical conditions that are related to kidney disease, such as hypertension, diabetes and vascular diseases.")}',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#00C6AD'),
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: const Icon(Icons.arrow_left, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  /// Title Section
  Container _titleSection() {
    return Container(
      height: 250,
      color: HexColor('#00C6AD'),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 15,
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: widget.doctor.firstName + widget.doctor.lastName,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/' + widget.doctor.image),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 15,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: HexColor('#FFBB23'),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    widget.doctor.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}