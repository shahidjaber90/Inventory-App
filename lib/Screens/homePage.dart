import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/Utils/colorPalatte1.dart';
import 'package:inventory/Utils/colorPalatte2.dart';
import 'package:inventory/Widgets/categoryBox_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorConstant.lightBlue.withOpacity(0.80),
              ColorConstant.middleBlue.withOpacity(0.40),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),

          /// items Drawer
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shahid Jaber',
                        style: GoogleFonts.eduSaBeginner(
                            fontSize: 22,
                            color: ColorConstant2.darkBlue,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ],
                  )),
                  Expanded(
                      child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: ColorConstant2.darkBlue,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: ColorConstant2.darkBlue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: ColorConstant2.darkBlue,
                        ),
                        title: Text(
                          'Profile',
                          style: TextStyle(color: ColorConstant2.darkBlue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: ColorConstant2.darkBlue,
                        ),
                        title: Text(
                          'Setting',
                          style: TextStyle(color: ColorConstant2.darkBlue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: ColorConstant2.darkBlue,
                        ),
                        title: Text(
                          'Log out',
                          style: TextStyle(color: ColorConstant2.darkBlue),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),

          // main screen
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: ColorConstant.lightBlue,
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row One Data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryBox(
                                  itemCount: 7.toInt(),
                                  itemText: 'Add Customers',
                                  valueColor: Colors.green.shade700,
                                ),
                                CategoryBox(
                                  itemCount: 103400.toInt(),
                                  itemText: 'All Customers',
                                  valueColor: Colors.blue.shade700,
                                ),
                              ],
                            ),
                            // Row Two Data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryBox(
                                  itemCount: 10340.toInt(),
                                  itemText: 'Due Customers',
                                  valueColor: Colors.red.shade700,
                                ),
                                CategoryBox(
                                  itemCount: 50000.toInt(),
                                  itemText: 'Expense - Income (This Week)',
                                  valueColor: Colors.blue.shade700,
                                ),
                              ],
                            ),
                            // Row three Data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryBox(
                                  itemCount: 0.toInt(),
                                  itemText: 'Low Stock',
                                  valueColor: Colors.red.shade700,
                                ),
                                CategoryBox(
                                  itemCount: 103400.toInt(),
                                  itemText: 'Stock Value Cost Price',
                                  valueColor: Colors.blue.shade700,
                                ),
                              ],
                            ),
                            // Row four Data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CategoryBox(
                                  itemCount: 0.toInt(),
                                  itemText: 'Stock Value     Selling Price',
                                  valueColor: Colors.blue.shade700,
                                ),
                                CategoryBox(
                                  itemCount: 0.toInt(),
                                  itemText: 'Customers StateMent',
                                  valueColor: Colors.blue.shade700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }),

          // animate control
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },

            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          ),
        ],
      ),
    );
  }
}
