import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:ecms/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final txtPass = TextEditingController();
  final txtUser = TextEditingController();
  FocusNode focusNodeUser = FocusNode();
  FocusNode focusNodePass = FocusNode();
  bool shouldpop = false,userFocused = false, passFocused = false;
  String _acoountType = Constants.admin,userName = '',passWord = '';

  @override
  void initState() {
    focusNodeUser.addListener((){
      setState(() => userFocused = !userFocused);
    });
    focusNodePass.addListener((){
      setState(() => passFocused = !passFocused);
    });
    super.initState();
  }

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        await onBackPress(ctx: this.context);
        return shouldpop;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.fill)),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height*.26,
                  ),
                  Text(
                    'Choose Account type',
                    style: TextStyle(
                        color: Color(0xff38b5ed),
                        fontSize: width*.05,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: height*.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _acoountType = Constants.admin;
                          });
                        },
                        child: Badge(
                          badgeContent: const Icon(Icons.check,color: Colors.white,size: 16,),
                          badgeColor: const Color(0xff38b5ed),
                          position: BadgePosition.bottomEnd(),
                          elevation: 7,
                          showBadge: _acoountType == Constants.admin? true : false,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: _acoountType == Constants.admin? const Color(0xff38b5ed):const Color(0xffbcc0cb),width: 1.5),color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: height*.122,
                            width: width*.22,
                            child: Column(children: [
                              const SizedBox(height: 5,),
                              Image.asset('assets/images/admin.png',height: 60,width: 50,),
                              const SizedBox(height: 1,),
                              Text('Admin',style: TextStyle(color: _acoountType == Constants.admin? const Color.fromARGB(255, 0, 0, 0):const Color(0xffbcc0cb)),)
                            ]),
                            ),
                        ),
                      ),
                      SizedBox(width: width*.06,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _acoountType = Constants.staff;
                          });
                        },
                        child: Badge(
                          badgeContent: const Icon(Icons.check,color: Colors.white,size: 16,),
                          badgeColor: const Color(0xff38b5ed),
                          position: BadgePosition.bottomEnd(),
                          elevation: 7,
                          showBadge: _acoountType == Constants.staff? true : false,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: _acoountType == Constants.staff? const Color(0xff38b5ed):const Color(0xffbcc0cb),width: 1.5),color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: height*.122,
                            width: width*.22,
                            child: Column(children: [
                              const SizedBox(height: 5,),
                              Image.asset('assets/images/staff.png',height: 60,width: 50,),
                              const SizedBox(height: 1,),
                              Text('Staff',style: TextStyle(color: _acoountType == Constants.staff? const Color.fromARGB(255, 0, 0, 0):const Color(0xffbcc0cb)),)
                            ]),
                            ),
                        ),
                      ),
                      SizedBox(width: width*.06,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _acoountType = Constants.parents;
                          });
                        },
                        child: Badge(
                          badgeContent: const Icon(Icons.check,color: Colors.white,size: 16,),
                          badgeColor: const Color(0xff38b5ed),
                          position: BadgePosition.bottomEnd(),
                          elevation: 7,
                          showBadge: _acoountType == Constants.parents? true : false,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: _acoountType == Constants.parents? const Color(0xff38b5ed):const Color(0xffbcc0cb),width: 1.5),color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            height: height*.122,
                            width: width*.22,
                            child: Column(children: [
                              const SizedBox(height: 5,),
                              Image.asset('assets/images/parents.png',height: 60,width: 50,),
                              const SizedBox(height: 1,),
                              Text('Parents',style: TextStyle(color: _acoountType == Constants.parents? const Color.fromARGB(255, 0, 0, 0):const Color(0xffbcc0cb)),)
                            ]),
                            ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*.04,),
                  Text(
                    'Welcome\nplease fillout the form below to get started',
                    style: TextStyle(
                        color: Color(0xffbcc0cb), fontFamily: 'poppins',fontSize: width*.035,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height*.04,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*.08),
                    child: Column(
                      children: [
                        SizedBox(
                          height:height*.1,
                          width: width*.9,
                          child: Stack(
                            children:[ Padding(
                              padding: EdgeInsets.only(top: height*.015),
                              child: TextFormField(
                                focusNode: focusNodeUser,
                                controller: txtUser,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_outline_rounded,
                                    color: Color(0xffbcc0cb),
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff38b5ed), width: 2)),
                                          errorStyle: TextStyle(fontSize: 12),
                                          contentPadding: EdgeInsets.all(0)
                                ),
                                onChanged: (value) {
                                      userName = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr('validation_username');
                                      }
                                      return null;
                                    },
                              ),
                            ),
                             Align(
                              alignment: const Alignment(-.7,-.9),
                              child: userFocused ? Container(
                                width: width*.25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: const Color(0xff38b5ed), ),
                                child: Text(tr('label_username'),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'poppins',fontSize: width*.034,fontWeight: FontWeight.bold,letterSpacing: .7),),
                              ):null,
                            )],
                          ),
                        ),
                        SizedBox(
                          height:height*.1,
                          width: width*.9,
                          child: Stack(
                            children:[ Padding(
                              padding: EdgeInsets.only(top: height*.015),
                              child: TextFormField(
                                focusNode: focusNodePass,
                                controller: txtPass,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xffbcc0cb),
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff38b5ed), width: 2)),
                                          contentPadding: EdgeInsets.all(0)
                                ),
                                onChanged: (value) {
                                      passWord = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr('validation_password');
                                      }
                                      return null;
                                    },
                              ),
                            ),
                             Align(
                              alignment: const Alignment(-.7,-.9),
                              child: passFocused ? Container(
                                width: width*.25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: const Color(0xff38b5ed), ),
                                child: Text(tr('label_password'),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: 'poppins',fontSize: width*.034,fontWeight: FontWeight.bold,letterSpacing: .7),),
                              ):null,
                            )],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width*.06,
                      ),
                      Text(
                        'forgot password?',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 134, 134, 138),
                            fontFamily: 'poppins',fontSize: width*.038),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Click Here',
                            style: TextStyle(
                                color: const Color(0xff38b5ed),
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: width*.035),
                          )),
                      SizedBox(
                        width: width*.09,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff38b5ed),
                        ),
                        height: height*.06,
                        width: width*.225,
                        child: FlatButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                  log('success');
                                  Navigator.pushReplacementNamed(context, '/home');
                                }
                            },
                            child: Text(
                              tr('login_button'),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'poppins',fontSize: width*.04),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
