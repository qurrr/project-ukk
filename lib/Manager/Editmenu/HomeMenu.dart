import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Authtambahmenu.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Makanan.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Minuman.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Tambahmenu.dart';
import 'package:kantin/Manager/Editmenu/Coffe/Coffe.dart';

class Homemenu extends StatefulWidget {
  @override
  _HomemenuState createState() => _HomemenuState();
}

class _HomemenuState extends State<Homemenu> {
  int _ongkir = 100;
  int _count = -0;
  int _selectedItemIndex = 0;
  int active = 0;

  final List<String> items = [
    'Makanan',
    'Minuman',
    'Coffe',
  ].obs;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 4,
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
          title: Text("Menu"),
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
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 170,
                  child: Text(
                    "Makanan",
                    style: TextStyle(
                        color: active == 0
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 15,
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
                  width: 130,
                  child: Text(
                    "Minuman",
                    style: TextStyle(
                        color: active == 1
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 15,
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
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 130,
                  child: Text(
                    "Coffe",
                    style: TextStyle(
                        color: active == 2
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: active == 2
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
                  width: 130,
                  child: Text(
                    "Tambah",
                    style: TextStyle(
                        color: active == 3
                            ? Colors.white
                            : Color.fromARGB(255, 24, 38, 88),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: active == 3
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
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [MakananMen(), MinumanMen(), CoffeMen(), TambahMen()],
        ),
      ),
    );
  }
}
