import 'package:ecms/screens/chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool shouldpop = false;

  Future onBackPress({ctx}) async {
    await showDialog<String>(
      context: ctx,
      builder: (BuildContext context) => AlertDialog(
        title: Text(tr('alert')),
        content: Text(tr('alert_exit')),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, tr('alert_cancel'));
              shouldpop = false;
            },
            child: Text(tr('alert_cancel')),
          ),
          TextButton(
            onPressed: () {
              shouldpop = true;
              Navigator.pop(context, tr('alert_ok'));
            },
            child: Text(tr('alert_ok')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await onBackPress(ctx: this.context);
        return shouldpop;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 15, 31, 255),
          title: const Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold),
              ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search,size: 30,),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff38b5ed),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: 30,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            const SizedBox(
              width: 40,
            ),
            IconButton(
                icon: const Icon(Icons.mail_outline_outlined),
                iconSize: 30,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            const SizedBox(
              width: 85,
            ),
            IconButton(
                icon: const Icon(Icons.notifications_none),
                iconSize: 30,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            const SizedBox(
              width: 40,
            ),
            IconButton(
                icon: const Icon(Icons.power_settings_new),
                iconSize: 30,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
          ]),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                    colors: [Color.fromARGB(255, 79, 91, 253), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.35, 0.35])),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 40),
                child: Text(
                  'Students Attendance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 160),
                child: PieChartSample2(),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  childAspectRatio: .93,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.amber, width: 3)),
                                  child: const Center(
                                      child: FaIcon(
                                    FontAwesomeIcons.graduationCap,
                                    color: Colors.amber,
                                    size: 20,
                                  ))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                'Students',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                '237',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Color(0xffbcc0cb)),
                              ),
                            )
                          ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color.fromARGB(255, 24, 202, 39),
                                          width: 3)),
                                  child: const Center(
                                      child: FaIcon(
                                    FontAwesomeIcons.moneyBill,
                                    color: Color.fromARGB(255, 24, 202, 39),
                                    size: 20,
                                  ))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                'Fees',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                '\$' '2400,50',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Color(0xffbcc0cb)),
                              ),
                            )
                          ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color.fromARGB(255, 79, 91, 253),
                                          width: 3)),
                                  child: const Center(
                                      child: FaIcon(
                                    FontAwesomeIcons.suitcase,
                                    color: Color.fromARGB(255, 79, 91, 253),
                                    size: 20,
                                  ))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                'Collection',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                '237',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Color(0xffbcc0cb)),
                              ),
                            )
                          ]),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color.fromARGB(255, 255, 7, 7),
                                          width: 3)),
                                  child: const Center(
                                      child: FaIcon(
                                    FontAwesomeIcons.dollarSign,
                                    color: Color.fromARGB(255, 255, 7, 7),
                                    size: 20,
                                  ))),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                'Disc./Refund',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Text(
                                '\$' '2400,50',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Color(0xffbcc0cb)),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
