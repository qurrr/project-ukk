import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/Minuman/Minuman.dart';
import 'package:kantin/Homemenu/Makanan/Makanan.dart';
import 'package:kantin/Homemenu/Coffe/Coffe.dart';
import 'package:kantin/Routing/Routes.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu1Page(),
    );
  }
}

class Menu1Page extends StatefulWidget {
  @override
  _Menu1PageState createState() => _Menu1PageState();
}

class _Menu1PageState extends State<Menu1Page> {
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
        drawer: buildsidebar(),
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Color.fromARGB(255, 6, 1, 61), size: 28),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Menu"),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 6, 1, 61)),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.KERANJANG),
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                    color: Color.fromARGB(255, 6, 1, 61),
                  )),
            ),
          ],
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
                    "Makanan",
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
                  width: 130,
                  child: Text(
                    "Minuman",
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
                        fontSize: 18,
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
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Homemakananview(), Homeminuman(), Homecoffeview()],
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
        Container(
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
        )
      ]),
    );
  }
}
