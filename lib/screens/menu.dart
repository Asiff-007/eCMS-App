import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final txtSearch = TextEditingController();
  String searchItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: txtSearch,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffbcc0cb),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffbcc0cb), width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff38b5ed), width: 2)),
                    errorStyle: TextStyle(fontSize: 12),
                    contentPadding: EdgeInsets.all(0)),
                onChanged: (value) {
                  searchItem = value;
                },
              ),
            ),
          ),
          GridView.builder(
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 8,
                  crossAxisCount: 3,
                  childAspectRatio: .82),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffbcc0cb)),
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    const Text('Leave\nApllication',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Color(0xffbcc0cb)),
                        textAlign: TextAlign.center)
                  ],
                );
              })
        ]),
      ),
    );
  }
}
