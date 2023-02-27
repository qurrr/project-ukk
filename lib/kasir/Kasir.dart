import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Sidebar/sidebar.dart';
import 'package:kantin/kasir/pesanansekarang/pesanansekarang.dart';
import 'package:kantin/kasir/pesananselesai/pesananselesai.dart';

import '../Routing/Routes.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KasirPage(),
    );
  }
}

class KasirPage extends StatefulWidget {
  @override
  _KasirPageState createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: SideBarWidget(),
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Color.fromARGB(255, 6, 1, 61), size: 28),
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: Container(
          //     child: Icon(
          //   Icons.menu,
          //   size: 30,
          //   color: Color.fromARGB(255, 6, 1, 61),
          // )),
          title: Text("Kasir"),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 6, 1, 61)),
          centerTitle: true,
          bottom: TabBar(
            onTap: (value) => setState(() {
              active = value;
            }),
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 170,
                  child: Text(
                    "Pesanan sekarang",
                    style: TextStyle(
                        color: active == 0
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: active == 0
                        ? Color.fromARGB(255, 24, 38, 88)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(73, 0, 0, 0),
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 170,
                  child: Text(
                    "Pesanan selesai",
                    style: TextStyle(
                        color: active == 1
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: active == 1
                        ? Color.fromARGB(255, 24, 38, 88)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(73, 0, 0, 0),
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PesananSekarang(),
            PesananSelesai(),
          ],
        ),
      ),
    );
  }

  Widget buildsidebar() {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 24, 38, 88),
          ),
          accountName: Text(
            "Rangga Fatur (kasir)",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          accountEmail:
              Text("Rangga@gmail.com", style: TextStyle(color: Colors.white)),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.LOGIN),
          child: Container(
            width: 190,
            height: 55,
            margin: EdgeInsets.only(left: 10, top: 15, right: 20),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 24, 38, 88),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 33,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
