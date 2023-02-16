import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/kasir/pesanansekarang/pesanansekarang.dart';

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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              child: Icon(
            Icons.menu,
            size: 30,
            color: Color.fromARGB(255, 6, 1, 61),
          )),
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
            Pesanansekarang(),
          ],
        ),
      ),
    );
  }

  Widget Pesanansekarang() {
    return ListView(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0.0, 0.0),
                    color: Colors.black,
                    blurRadius: 3.0,
                    spreadRadius: 0.0)
              ]),
          child: Row(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "atas nama",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ahmad aldi",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Text(
                "001",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
