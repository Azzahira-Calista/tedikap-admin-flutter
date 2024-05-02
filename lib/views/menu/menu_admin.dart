// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:tedikap_admin/widgets/bottom_navbar.dart';
import 'package:tedikap_admin/widgets/button.dart';
import 'package:tedikap_admin/widgets/item_menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    // appBar: AppBar(
    //   automaticallyImplyLeading: false,
    //   title: Text("Tedikap Menu"),
    //   centerTitle: true,
    // ),
    // body: SingleChildScrollView(
    //   child: Container(
    //     padding: EdgeInsets.all(20),
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 40,
    //           child: TextField(
    //             decoration: InputDecoration(
    //               suffixIcon: Icon(Icons.search),
    //               hintStyle: TextStyle(
    //                   color: offColor,
    //                   fontWeight: FontWeight.w400,
    //                   fontSize: figmaFontsize(12)),
    //               hintText: "Cari makanan dan minuman",
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(15),
    //                 borderSide: BorderSide(color: offColor),
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.sizeOf(context).height * 0.02,
    //         ),
    //         Container(
    //           height: 50,
    //           decoration: BoxDecoration(color: offColor),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.sizeOf(context).height * 0.04,
    //         ),
    //         Container(
    //           height: 500,
    //           padding: EdgeInsets.all(8),
    //           child: GridView.builder(
    //             gridDelegate:
    //                 const SliverGridDelegateWithFixedCrossAxisCount(
    //                     crossAxisCount: 2,
    //                     crossAxisSpacing: 12,
    //                     mainAxisSpacing: 20,
    //                     childAspectRatio: 1.4),
    //             itemCount: 8,
    //             itemBuilder: (BuildContext context, int index) {
    //               return ItemWidget();
    //             },
    //           ),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.sizeOf(context).height * 0.02,
    //         ),
    //         myButton(
    //             text: 'Tambah menu',
    //             onPressed: () {},
    //             color: primaryColor,
    //             textColor: white)
    //       ],
    //     ),
    //   ),
    // ),

    // bottomNavigationBar: MyNavBar());

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Tedikap Menu",
                style: appBarText,
              ),
              centerTitle: true,
              bottom: const TabBar(
                  unselectedLabelColor: offColor,
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: ("Tea"),
                    ),
                    Tab(
                      text: ("Non Tea"),
                    ),
                    Tab(
                      text: ("Snacks"),
                    )
                  ]),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget();
                          },
                        ),
                        SizedBox(height: 30), // Adjust the height as needed
                        myButton(
                            text: 'Tambah menu',
                            onPressed: () {},
                            color: primaryColor,
                            textColor: white)
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget();
                          },
                        ),
                        SizedBox(height: 30), // Adjust the height as needed
                        myButton(
                            text: 'Tambah menu',
                            onPressed: () {},
                            color: primaryColor,
                            textColor: white)
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget();
                          },
                        ),
                        SizedBox(height: 30), // Adjust the height as needed
                        myButton(
                            text: 'Tambah menu',
                            onPressed: () {},
                            color: primaryColor,
                            textColor: white)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: MyNavBar()));
  }
}
