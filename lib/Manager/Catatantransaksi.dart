import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/kasir/controller/controller.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatatanPage(),
    );
  }
}

class CatatanPage extends StatefulWidget {
  @override
  _CatatanPageState createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  int _ongkir = 100;
  int _count = -0;
  int _selectedItemIndex = 0;
  int active = 0;
  void _incrementCount() {
    setState(() {
      _count--;
    });
  }

  void _decrementCount() {
    setState(() {
      _count++;
    });
  }

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
            title: Text("Catatan transaksi"),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 1, 61)),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [pendapatanh()],
          )),
    );
  }

  Widget pendapatanh() {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "No transaksi",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "001",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "pelanggan aris",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Total Bayar",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "80000",

                    // kasirController.total2h.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kasir afi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
