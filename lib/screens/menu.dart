import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final txtSearch = TextEditingController();
  String searchItem = '';
  var dataList = [
    ['assets/images/menu/teacher-(1).png','Staff Attendance'],
    ['assets/images/menu/student.png','Student Attendance'],
    ['assets/images/menu/profile.png','Student Profile'],
    ['assets/images/menu/profile-(1).png','Staff Profile'],
    ['assets/images/menu/timetable.png','Class Timetable'],
    ['assets/images/menu/event.png','Upcomming Events'],
    ['assets/images/menu/reminder.png','Reminder'],
    ['assets/images/menu/people.png','Group'],
    ['assets/images/menu/mailbox.png','Mail Box']
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height*.20,
            color: const Color(0xff38b5ed),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: width*.08 , right: width*.08 ,top: height * .05),
                child: TextField(
                  controller: txtSearch,
                  decoration: InputDecoration(
                    filled: true,
                      fillColor:  const Color.fromARGB(255, 163, 222, 250),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xffbcc0cb), width: width*.001),
                          borderRadius: BorderRadius.circular(height*.008),    
                              ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xffbcc0cb), width: width*.001),
                          borderRadius: BorderRadius.circular(height*.008),    
                              ),
                      errorStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.all(0)),
                  onChanged: (value) {
                    searchItem = value;
                  },
                ),
              ),
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.only(bottom: height * .05),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: height * .0813,
                        width: width*.194,
                        
                        decoration: const BoxDecoration(
                          color: Color(0xff38b5ed),
                          ),
                        child: Center(child: Image(image: ExactAssetImage(dataList[index][0],scale:width*.0044),)),  
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          
                          border: Border(top: BorderSide(color: const Color.fromARGB(255, 204, 203, 203),width:width * .0014))),
                        height: height * .0813,
                        
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: width*.055),
                            child: Text(dataList[index][1],
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: width* .039,
                                    letterSpacing: 1,
                                    color: const Color(0xffbcc0cb)),
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              })
        ]),
      ),
    );
  }
}
