import 'package:ecms/screens/pi_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bar_chart.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({ Key? key }) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 15, 31, 255),
          title: Text(
            'Dashboard',
            style: TextStyle(
                color: Colors.white,
                fontSize: width * .075,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * .03),
              child: Icon(
                Icons.search,
                size: width * .08,
              ),
            )
          ],
        ),
      body: SingleChildScrollView(
            child: Container(
              height: height * 1.2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                      colors: [
                        Color.fromARGB(255, 79, 91, 253),
                        Colors.white,
                        Colors.white,
                        Color.fromARGB(255, 79, 91, 253)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.33, 0.33, .60, .60])),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: height * .03,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * .05, bottom: height * .06),
                  child: Text(
                    'Students Attendance',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width*.05,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * .08, left: width * .45),
                  child: const PieChartSample2(),
                ),
                SizedBox(
                  height: height * .11,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: height * .01, right: height * .01),
                  child: GridView.count(
                    padding: EdgeInsets.only(
                        left: width * .02,
                        right: width * .02,
                        bottom: height * .02),
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 8,
                    childAspectRatio: height * .0013,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      Container(
                        margin: EdgeInsets.all(height * .009),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 196, 192, 192),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * .035),
                                child: Container(
                                    height: height*.07,
                                    width: width*.14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.amber, width: 3)),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.graduationCap,
                                      color: Colors.amber,
                                      size: width*.05,
                                    ))),
                              ),
                              SizedBox(
                                height: height * .028,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  'Students',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.045,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(
                                height: height*.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  '237',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.042,
                                      letterSpacing: 1,
                                      color: const Color(0xffbcc0cb)),
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.all(height * .009),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 196, 192, 192),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * .035),
                                child: Container(
                                    height: height*.07,
                                    width: width*.14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 24, 202, 39),
                                            width: 3)),
                                    child: const Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.moneyBill,
                                      color: Color.fromARGB(255, 24, 202, 39),
                                      size: 18,
                                    ))),
                              ),
                              SizedBox(
                                height: height * .028,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  'Fees',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.045,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(
                                height: height*.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  '\$' '2400,50',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.042,
                                      letterSpacing: 1,
                                      color: const Color(0xffbcc0cb)),
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.all(height * .009),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 196, 192, 192),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * .035),
                                child: Container(
                                    height: height*.07,
                                    width: width*.14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 79, 91, 253),
                                            width: 3)),
                                    child: const Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.suitcase,
                                      color: Color.fromARGB(255, 79, 91, 253),
                                      size: 18,
                                    ))),
                              ),
                              SizedBox(
                                height: height * .028,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  'Collection',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.045,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(
                                height: height*.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  '237',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.042,
                                      letterSpacing: 1,
                                      color: Color(0xffbcc0cb)),
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.all(height * .009),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 196, 192, 192),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * .035),
                                child: Container(
                                    height: height*.07,
                                    width: width*.14,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 7, 7),
                                            width: 3)),
                                    child: const Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.dollarSign,
                                      color: Color.fromARGB(255, 255, 7, 7),
                                      size: 18,
                                    ))),
                              ),
                              SizedBox(
                                height: height * .028,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  'Disc./Refund',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.045,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(
                                height: height*.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .035),
                                child: Text(
                                  '\$' '2400,50',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: width*.042,
                                      letterSpacing: 1,
                                      color: Color(0xffbcc0cb)),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * .1, top: height * .01, bottom: width * .1),
                  child: Text(
                    'Fee status',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width*.05,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * .1, right: width * .1),
                  child: const BarChartSample7(),
                ),
              ]),
            ),
          ),
    );
  }
}