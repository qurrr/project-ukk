import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kantin/Homemenu/Coffe/productsingle.dart';
import 'package:kantin/Manager/model/datenow.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:get/get.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManagerPage(),
    );
  }
}

class ManagerPage extends StatefulWidget {
  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  DateTime today = DateTime.now();
  DateTime findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: buildsidebar(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            // leading: Container(
            //     child: Icon(
            //   Icons.menu,
            //   size: 30,
            //   color: Color.fromARGB(255, 6, 1, 61),
            // )),
            title: Text("Manager"),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 1, 61)),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.HOMEMENUMANAGER),
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 32, 58),
                              borderRadius: BorderRadius.circular(5)),
                          height: 40,
                          width: 120,
                          child: Text(
                            "Menu",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 32, 58),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Log Aktivitas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Pendapatan bulanan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: ListView(
                  children: [
                    pendapatanb(),
                  ],
                ))
              ],
            ),
          )),
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

  Widget pendapatanb() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: ListView.builder(
          itemCount: tgl.length,
          itemBuilder: (context, index) {
            tanggalnow tanggal = tgl[index];
            return GestureDetector(
              onTap: () => Get.toNamed(
                Routes.PENDAPATANHARIAN,
                arguments: tanggal.bulan,
              ),

              // {
              //   if (tanggal.tglakhir == "31 - 1") {
              //     Get.toNamed(
              //       Routes.PENDAPATANHARIAN,
              //       arguments: tanggal.bulan,
              //     );
              //   } else if (tanggal.tglakhir == "28 - 2") {
              //     Get.toNamed(
              //       Routes.PENDAPATANHARIAN,
              //       arguments: tanggal.bulan,
              //     );
              //   }
              // },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${tanggal.tglawal.toString()}/${DateFormat.y().format(today)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "--",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${tanggal.tglakhir.toString()}/${DateFormat.y().format(today)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
