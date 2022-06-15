import 'package:ecms/screens/bar_chart.dart';
import 'package:ecms/screens/status.dart';
import 'package:ecms/screens/menu.dart';
import 'package:ecms/screens/pi_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool shouldpop = false, menuPop = false;

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

  void onTabTapped() {
    setState(() {
      menuPop = !menuPop;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        await onBackPress(ctx: this.context);
        return shouldpop;
      },
      child: Scaffold(
        extendBody: true,
        
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: FloatingActionButton(
              backgroundColor: const Color(0xff38b5ed),
              child: Icon(
                Icons.menu,
                size: width * .09,
              ),
              onPressed: () {
                onTabTapped();
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: width * .025,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                icon: const Icon(Icons.info_outline),
                iconSize: width * .085,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            SizedBox(
              width: width * .1,
            ),
            IconButton(
                icon: const Icon(Icons.mail_outline_outlined),
                iconSize: width * .085,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            SizedBox(
              width: width * .25,
            ),
            IconButton(
                icon: const Icon(Icons.notifications_none),
                iconSize: width * .085,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
            SizedBox(
              width: width * .1,
            ),
            IconButton(
                icon: const Icon(Icons.power_settings_new),
                iconSize: width * .085,
                color: const Color(0xffbcc0cb),
                onPressed: () {}),
          ]),
        ),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (Widget child, Animation<double> animation) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOutQuint;

              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
            child: menuPop ? const MenuPage() : const StatusPage()),
      ),
    );
  }
}
