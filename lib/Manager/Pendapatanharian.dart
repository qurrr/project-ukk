import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Manager/controller/controller.dart';
import 'package:kantin/Manager/model/datenow.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/kasir/controller/controller.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PendapatanHPage(),
    );
  }
}

class PendapatanHPage extends StatefulWidget {
  @override
  _PendapatanHPageState createState() => _PendapatanHPageState();
}

class _PendapatanHPageState extends State<PendapatanHPage> {

 final tanggalnow bulan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
                child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color.fromARGB(255, 6, 1, 61),
              ),
            )),
            title: Text("Pendapatan harian"),
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
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pendapatan Harian",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 5,
                                  spreadRadius: 0)
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          autocorrect: false,
                          showCursor: true,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Cari',
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: ListView(
                  children: [
                    pendapatanh(),
                  ],
                ))
              ],
            ),
          )),
    );
  }

  Widget pendapatanh() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CATATANTRANSAKSI),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
        height: 90,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "02/02",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kasir afi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Text(
              "Total Pendapatan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "90000",

              // kasirController.total2b.toString(),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
